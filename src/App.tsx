import { mealPilotApi } from "./services/api";
import { useEffect, useMemo, useState, type FormEvent } from "react";
import { Activity, Apple, ArrowDownRight, ArrowRight, BarChart3, CalendarDays, Check, ChefHat, CircleHelp, ClipboardList, Clock3, Dumbbell, Flame, Heart, House, Leaf, LogIn, LogOut, Plus, Search, Settings2, ShoppingCart, Sparkles, Target, UserRound, Wallet, X } from "lucide-react";
import { RECIPES } from "./data/recipes";
import type { AthleteProfile, Goal, MealKey, Recipe, ShoppingItem, ViewName, WeeklyPlan } from "./types";
import { readStorage, writeStorage } from "./utils/storage";

type AppUser = {
  id?: number;
  email: string;
  name: string;
  token?: string;
};

const DAYS = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];
const DAY_SHORT = ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"];
const MEALS: { key: MealKey; label: string; icon: string }[] = [
  { key: "breakfast", label: "Petit-déjeuner", icon: "☀️" },
  { key: "lunch", label: "Déjeuner", icon: "🥗" },
  { key: "dinner", label: "Dîner", icon: "🌙" },
  { key: "snack", label: "Collation", icon: "🍌" },
];
const NAV: { id: ViewName; label: string; icon: typeof House }[] = [
  { id: "dashboard", label: "Vue d'ensemble", icon: House },
  { id: "planner", label: "Planning repas", icon: CalendarDays },
  { id: "recipes", label: "Recettes", icon: ChefHat },
  { id: "favorites", label: "Mes favoris", icon: Heart },
  { id: "shopping", label: "Liste de courses", icon: ShoppingCart },
  { id: "progress", label: "Suivi nutrition", icon: BarChart3 },
  { id: "profile", label: "Mon profil", icon: Settings2 },
];
const DEMO_EMAIL = "demo@mealpilot.app";
const DEMO_PASSWORD = "mealpilot";
const DEFAULT_PROFILE: AthleteProfile = { name: "Alex", age: 27, sex: "homme", height: 178, weight: 82, activity: 1.55, goal: "bulk", budget: 65, diet: "omnivore", avoid: "", portions: 1 };
function recipeFitsDiet(recipe: Recipe, diet: AthleteProfile["diet"]): boolean {
  if (diet !== "omnivore" && recipe.ingredients.some(i => ["Viandes", "Poisson"].includes(i.category))) return false;
  if (diet !== "vegan") return true;
  const animalProducts = ["œufs", "oeufs", "skyr", "fromage blanc", "emmental", "cottage cheese", "yaourt nature", "lait", "fromage", "crème", "creme", "whey", "petit-suisse", "miel"];
  return !recipe.ingredients.some(i => {
    const name = i.name.toLocaleLowerCase("fr");
    if (name.includes("soja") || name.includes("coco")) return false;
    return animalProducts.some(term => name.includes(term));
  });
}

const blankPlan = (): WeeklyPlan => Object.fromEntries(DAYS.map(d => [d, { breakfast: "", lunch: "", dinner: "", snack: "" }])) as WeeklyPlan;
const storageKey = (email: string, part: string) => `mealpilot-v3:${email}:${part}`;
const goalLabel: Record<Goal, string> = { bulk: "Prise de masse", cut: "Sèche", maintain: "Maintien" };

function estimateTargets(profile: AthleteProfile) {
  const bmr = profile.sex === "homme" ? 10 * profile.weight + 6.25 * profile.height - 5 * profile.age + 5 : 10 * profile.weight + 6.25 * profile.height - 5 * profile.age - 161;
  const maintenance = Math.round(bmr * profile.activity);
  const calories = Math.round(maintenance * (profile.goal === "bulk" ? 1.10 : profile.goal === "cut" ? 0.82 : 1));
  const protein = Math.round(profile.weight * (profile.goal === "cut" ? 2 : 1.8));
  const fat = Math.round((calories * 0.27) / 9);
  const carbs = Math.max(0, Math.round((calories - protein * 4 - fat * 9) / 4));
  return { calories, protein, carbs, fat, maintenance };
}
function fmt(n: number) { return Math.round(n).toLocaleString("fr-FR"); }
function fmtQty(n: number) { return (Math.round(n * 10) / 10).toLocaleString("fr-FR"); }
function RecipeCard({ recipe, favorite, onFavorite, onPlan, onDetails }: { recipe: Recipe; favorite: boolean; onFavorite: () => void; onPlan: () => void; onDetails: () => void }) {
  return <article className="mp-recipe-card"><div className="mp-recipe-art" style={{ background: recipe.color }}><span className="mp-recipe-tag">{recipe.category}</span><span className="mp-food-emoji">{recipe.emoji}</span><button className={`mp-heart ${favorite ? "active" : ""}`} onClick={onFavorite} aria-label={favorite ? "Retirer des favoris" : "Ajouter aux favoris"}><Heart size={17} fill={favorite ? "currentColor" : "none"}/></button></div><div className="mp-recipe-content"><h3>{recipe.name}</h3><p>{recipe.description}</p><div className="mp-recipe-stats"><span><Clock3 size={13}/>{recipe.time} min</span><span><Flame size={13}/>{recipe.kcal} kcal</span><span><Dumbbell size={13}/>{recipe.protein} g prot.</span></div><div className="mp-recipe-actions"><button className="mp-btn mp-btn-soft" onClick={onDetails}>Détails</button><button className="mp-btn mp-btn-primary" onClick={onPlan}>Planifier <ArrowRight size={14}/></button></div></div></article>;
}

export default function App() {
  const [recipes, setRecipes] = useState<Recipe[]>(RECIPES);
  const [recipesLoading, setRecipesLoading] = useState(true);
  const [recipesError, setRecipesError] = useState("");

  const [user, setUser] = useState<AppUser | null>(
    () => readStorage<AppUser | null>("mealpilot-v3:session", null)
  );
  const [authMode, setAuthMode] = useState<"login" | "register">("login");
  const [authName, setAuthName] = useState(""); const [authEmail, setAuthEmail] = useState(DEMO_EMAIL); const [authPassword, setAuthPassword] = useState(DEMO_PASSWORD); const [authError, setAuthError] = useState("");
  const [view, setView] = useState<ViewName>("dashboard");
  const [profile, setProfile] = useState<AthleteProfile>(DEFAULT_PROFILE);
  const [loadedFor, setLoadedFor] = useState("");
  const [plan, setPlan] = useState<WeeklyPlan>(blankPlan());
  const [favorites, setFavorites] = useState<string[]>([]);
  const [checked, setChecked] = useState<string[]>([]);
  const [eaten, setEaten] = useState<string[]>([]);
  const [pantry, setPantry] = useState<string[]>([]);
  const [query, setQuery] = useState("");
  const [category, setCategory] = useState("Toutes");
  const [toast, setToast] = useState("");
  const [selectedRecipe, setSelectedRecipe] = useState<Recipe | null>(null);
  const [newPantry, setNewPantry] = useState("");
  const [profileSaved, setProfileSaved] = useState(true);

  useEffect(() => { writeStorage("mealpilot-v3:session", user); }, [user]);
  useEffect(() => {
    if (!user) {
      setLoadedFor("");
      setFavorites([]);
      return;
    }

    const currentUser = user;
    let cancelled = false;

    setLoadedFor("");

    setProfile(readStorage(storageKey(currentUser.email, "profile"), DEFAULT_PROFILE));
    setPlan(readStorage(storageKey(currentUser.email, "plan"), blankPlan()));
    setChecked(readStorage(storageKey(currentUser.email, "checked"), []));
    setEaten(readStorage(storageKey(currentUser.email, "eaten"), []));
    setPantry(readStorage(storageKey(currentUser.email, "pantry"), []));

    async function loadFavorites() {
      if (currentUser.token) {
        try {
          const data = await mealPilotApi.favorites(currentUser.token);

          if (!cancelled) {
            setFavorites(data.map((favorite) => favorite.id));
          }
        } catch (error) {
          if (!cancelled) {
            console.error("Erreur de chargement des favoris :", error);
            setFavorites(readStorage(storageKey(currentUser.email, "favorites"), []));
            notify("Impossible de charger les favoris depuis le serveur.");
          }
        }
      } else {
        setFavorites(readStorage(storageKey(currentUser.email, "favorites"), []));
      }

      if (!cancelled) {
        setLoadedFor(currentUser.email);
      }
    }

    void loadFavorites();

    return () => {
      cancelled = true;
    };
  }, [user?.email, user?.token]);
  useEffect(() => { if (user && loadedFor === user.email) writeStorage(storageKey(user.email, "profile"), profile); }, [profile, user?.email, loadedFor]);
  useEffect(() => { if (user && loadedFor === user.email) writeStorage(storageKey(user.email, "plan"), plan); }, [plan, user?.email, loadedFor]);
  useEffect(() => { if (user && loadedFor === user.email) writeStorage(storageKey(user.email, "favorites"), favorites); }, [favorites, user?.email, loadedFor]);
  useEffect(() => { if (user && loadedFor === user.email) writeStorage(storageKey(user.email, "checked"), checked); }, [checked, user?.email, loadedFor]);
  useEffect(() => { if (user && loadedFor === user.email) writeStorage(storageKey(user.email, "eaten"), eaten); }, [eaten, user?.email, loadedFor]);
  useEffect(() => { if (user && loadedFor === user.email) writeStorage(storageKey(user.email, "pantry"), pantry); }, [pantry, user?.email, loadedFor]);
  useEffect(() => {
    let cancelled = false;

    async function loadRecipes() {
      try {
        setRecipesLoading(true);

        const data = await mealPilotApi.recipes();

        if (cancelled) return;

        if (data.length > 0) {
          setRecipes(data);
          setRecipesError("");
        } else {
          setRecipesError("L'API n'a renvoyé aucune recette. Les données locales sont conservées.");
        }
      } catch (error) {
        if (cancelled) return;

        console.error("Erreur de chargement des recettes :", error);
        setRecipesError("API indisponible : affichage des recettes locales.");
      } finally {
        if (!cancelled) {
          setRecipesLoading(false);
        }
      }
    }

    void loadRecipes();

    return () => {
      cancelled = true;
    };
  }, []);

  const targets = useMemo(() => estimateTargets(profile), [profile]);
  const plannedIds = useMemo(() => DAYS.flatMap(d => MEALS.map(m => plan[d]?.[m.key]).filter(Boolean)), [plan]);
  const plannedMeals = plannedIds.length;
  const plannedRecipes = useMemo(() => plannedIds.map(id => recipes.find(r => r.id === id)).filter((r): r is Recipe => !!r), [plannedIds, recipes]);
  const shoppingItems = useMemo(() => {
    const map = new Map<string, ShoppingItem>();
    plannedRecipes.forEach(recipe => recipe.ingredients.forEach(ingredient => {
      const key = ingredient.name.toLocaleLowerCase("fr"); const previous = map.get(key);
      const quantity = ingredient.quantity * profile.portions;
      const estimatedCost = ingredient.estimatedCost * profile.portions;
      if (previous) { previous.quantity += quantity; previous.estimatedCost += estimatedCost; }
      else map.set(key, { name: ingredient.name, category: ingredient.category, quantity, unit: ingredient.unit, estimatedCost });
    }));
    return [...map.values()].sort((a,b) => a.category.localeCompare(b.category, "fr"));
  }, [plannedRecipes, profile.portions]);
  const totalCost = shoppingItems.reduce((sum, item) => sum + item.estimatedCost, 0);
  const categories = ["Toutes", ...Array.from(new Set(recipes.map(r => r.category)))];
  const visibleRecipes = recipes.filter(r => (view !== "favorites" || favorites.includes(r.id)) && (category === "Toutes" || r.category === category) && `${r.name} ${r.description} ${r.category} ${r.ingredients.map(i=>i.name).join(" ")}`.toLocaleLowerCase("fr").includes(query.toLocaleLowerCase("fr")) && recipeFitsDiet(r, profile.diet));
  const consumed = useMemo(() => eaten.map(id => recipes.find(r => r.id === id)).filter((r): r is Recipe => !!r), [eaten, recipes]);
  const todayMacros = consumed.reduce((acc, r) => ({ kcal: acc.kcal + r.kcal, protein: acc.protein + r.protein, carbs: acc.carbs + r.carbs, fat: acc.fat + r.fat }), { kcal: 0, protein: 0, carbs: 0, fat: 0 });
  const goalProgress = Math.min(100, Math.round(todayMacros.kcal / targets.calories * 100));
  const currentTitle: Record<ViewName, { eyebrow: string; title: string }> = {
    dashboard: { eyebrow: "TON ESPACE PERFORMANCE", title: `Salut ${profile.name || user?.name || "champion"} 👋` },
    planner: { eyebrow: "ORGANISATION DE LA SEMAINE", title: "Mon planning repas" },
    recipes: { eyebrow: "TON CARNET DE CUISINE", title: "Explorer les recettes" },
    favorites: { eyebrow: "À GARDER SOUS LA MAIN", title: "Mes favoris" },
    shopping: { eyebrow: "DU PLANNING AU PANIER", title: "Ma liste de courses" },
    progress: { eyebrow: "TES REPÈRES AU QUOTIDIEN", title: "Suivi nutritionnel" },
    profile: { eyebrow: "À TON RYTHME", title: "Profil & objectifs" },
  };
  function notify(message: string) { setToast(message); window.setTimeout(() => setToast(""), 2600); }
  function loginDemo() {
    const demo: AppUser = { email: DEMO_EMAIL, name: "Alex" }; setUser(demo);
    const saved = readStorage(storageKey(DEMO_EMAIL, "plan"), null);
    if (!saved) {
      const initial = makePlan(DEFAULT_PROFILE); setPlan(initial); writeStorage(storageKey(DEMO_EMAIL, "plan"), initial);
      writeStorage(storageKey(DEMO_EMAIL, "profile"), DEFAULT_PROFILE);
      writeStorage(storageKey(DEMO_EMAIL, "favorites"), ["chicken-rice", "overnight", "chili"]);
    }
    setView("dashboard"); notify("Session de démonstration ouverte.");
  }
  async function authenticate(e: FormEvent) {
    e.preventDefault();
    setAuthError("");

    const email = authEmail.trim().toLowerCase();

    if (!email || !authPassword) {
      setAuthError("Renseigne ton e-mail et ton mot de passe.");
      return;
    }

    if (email === DEMO_EMAIL && authPassword === DEMO_PASSWORD) {
      loginDemo();
      return;
    }

    try {
      const response =
        authMode === "register"
          ? await mealPilotApi.register(
              authName.trim() || email.split("@")[0],
              email,
              authPassword
            )
          : await mealPilotApi.login(email, authPassword);

      // Profil et planning restent locaux : on les initialise au premier passage sur ce navigateur.
      if (!readStorage(storageKey(email, "plan"), null)) {
        const newProfile = { ...DEFAULT_PROFILE, name: response.user.name };
        writeStorage(storageKey(email, "profile"), newProfile);
        writeStorage(storageKey(email, "plan"), makePlan(newProfile));
      }

      setUser({
        id: response.user.id,
        email: response.user.email,
        name: response.user.name,
        token: response.token,
      });

      setView("dashboard");
      notify(
        authMode === "register"
          ? "Compte créé avec succès."
          : "Connexion réussie."
      );
    } catch (error) {
      setAuthError(
        error instanceof Error
          ? error.message
          : "Impossible de se connecter au serveur."
      );
    }
  }
async function logout() {
  const token = user?.token;

  setUser(null);
  setAuthPassword("");
  setAuthEmail("");
  setAuthName("");
  setAuthError("");
  setView("dashboard");

  if (token) {
    try {
      await mealPilotApi.logout(token);
    } catch (error) {
      console.error("Erreur lors de la déconnexion :", error);
    }
  }
}
  function makePlan(p: AthleteProfile): WeeklyPlan {
    const excluded = p.avoid.split(",").map(x => x.trim().toLocaleLowerCase("fr")).filter(Boolean);
    const allowed = recipes.filter(r => {
      if (r.ingredients.some(i => excluded.some(term => i.name.toLocaleLowerCase("fr").includes(term)))) return false;
      return recipeFitsDiet(r, p.diet);
    });
    const categories: Record<MealKey, string> = {
      breakfast: "Petit-déjeuner", lunch: "Déjeuner", dinner: "Dîner", snack: "Collation"
    };
    const slotWeights: Record<MealKey, number> = { breakfast: 0.20, lunch: 0.30, dinner: 0.30, snack: 0.20 };
    const slots: Record<MealKey, Recipe[]> = {
      breakfast: allowed.filter(r => r.category === categories.breakfast),
      lunch: allowed.filter(r => r.category === categories.lunch),
      dinner: allowed.filter(r => r.category === categories.dinner),
      snack: allowed.filter(r => r.category === categories.snack),
    };
    // Keep the user's budget meaningful for the selected number of portions.
    const portionCount = Math.max(1, p.portions || 1);
    const weeklyBudgetPerPortion = Math.max(0, p.budget) / portionCount;
    const next = blankPlan();
    const used = new Map<string, number>();
    const orderedSlots = DAYS.flatMap(day => MEALS.map(meal => ({ day, meal })));
    let runningCost = 0;
    orderedSlots.forEach(({ day, meal }, index) => {
      const options = slots[meal.key].length ? slots[meal.key] : allowed;
      if (!options.length) return;
      const remainingSlots = orderedSlots.length - index;
      const remainingBudget = Math.max(0, weeklyBudgetPerPortion - runningCost);
      const averageRemaining = remainingBudget / Math.max(1, remainingSlots);
      const slotBudget = weeklyBudgetPerPortion * slotWeights[meal.key] / 7;
      const affordable = options.filter(r => r.cost <= averageRemaining + 0.02);
      const pool = affordable.length ? affordable : options;
      const ranked = [...pool].sort((a, b) => {
        const score = (r: Recipe) => {
          const repeatCount = used.get(r.id) || 0;
          const proteinBenefit = Math.min(r.protein, 45) * 0.014;
          const overSlot = Math.max(0, r.cost - slotBudget);
          const overAverage = Math.max(0, r.cost - averageRemaining);
          return r.cost - proteinBenefit + overSlot * 0.45 + overAverage * 2.2 + repeatCount * 0.9;
        };
        return score(a) - score(b);
      });
      // A small rotating offset avoids producing the exact same menu on every generation.
      const bestScore = (r: Recipe) => r.cost - Math.min(r.protein, 45) * 0.014 + Math.max(0, r.cost - slotBudget) * 0.45 + Math.max(0, r.cost - averageRemaining) * 2.2 + (used.get(r.id) || 0) * 0.9;
      const shortlist = ranked.filter(r => bestScore(r) <= bestScore(ranked[0]) + 0.22).slice(0, 4);
      const pick = shortlist[(index + Math.floor(Math.random() * shortlist.length)) % shortlist.length] || ranked[0];
      next[day][meal.key] = pick.id;
      used.set(pick.id, (used.get(pick.id) || 0) + 1);
      runningCost += pick.cost;
    });
    return next;
  }
  function generatePlan() {
    const next = makePlan(profile);
    setPlan(next); setChecked([]);
    const estimate = Object.values(next).reduce((sum, day) => sum + Object.values(day).reduce((daySum, id) => daySum + (recipes.find(r => r.id === id)?.cost || 0) * Math.max(1, profile.portions), 0), 0);
    notify(estimate <= profile.budget ? `Planning généré : environ ${estimate.toFixed(0)} € / semaine.` : `Planning généré, mais budget estimé à ${estimate.toFixed(0)} € pour ${profile.budget} €.`);
  }
  function setMeal(day: string, meal: MealKey, id: string) { setPlan(current => ({ ...current, [day]: { ...current[day], [meal]: id } })); }
  async function toggleFavorite(id: string) {
    const isFavorite = favorites.includes(id);

    try {
      if (user?.token) {
        if (isFavorite) {
          await mealPilotApi.removeFavorite(user.token, id);
        } else {
          await mealPilotApi.addFavorite(user.token, id);
        }
      }

      setFavorites((current) =>
        current.includes(id)
          ? current.filter((favoriteId) => favoriteId !== id)
          : [...current, id]
      );

      notify(isFavorite ? "Retiré des favoris." : "Ajouté aux favoris.");
    } catch (error) {
      console.error("Erreur de mise à jour des favoris :", error);
      notify("Impossible de modifier les favoris. Réessaie.");
    }
  }
  function addToPlan(id: string) { const slot: MealKey = recipes.find(r => r.id === id)?.category === "Petit-déjeuner" ? "breakfast" : recipes.find(r => r.id === id)?.category === "Collation" ? "snack" : recipes.find(r => r.id === id)?.category === "Dîner" ? "dinner" : "lunch"; setPlan(current => { const day = DAYS.find(d => !current[d]?.[slot]) || "Lundi"; return { ...current, [day]: { ...current[day], [slot]: id } }; }); notify("Recette ajoutée au prochain créneau disponible."); setSelectedRecipe(null); setView("planner"); }
  function toggleEaten(id: string) { setEaten(current => current.includes(id) ? current.filter(x => x !== id) : [...current, id]); }
  function toggleShopping(name: string) { const key = name.toLocaleLowerCase("fr"); setChecked(current => current.includes(key) ? current.filter(x => x !== key) : [...current, key]); }

  if (!user) return <div className="mp-auth-screen"><div className="mp-auth-panel"><div className="mp-brand"><span className="mp-brand-icon"><Activity size={23}/></span><span>meal<span>pilot</span><small>FUEL YOUR GOALS</small></span></div><div className="mp-auth-visual"><div className="mp-orbit mp-orbit-one"/><div className="mp-orbit mp-orbit-two"/><div className="mp-auth-bowl">🥗</div><div className="mp-float-card"><Flame size={16}/><span><b>2 450 kcal</b><small>Objectif quotidien</small></span></div><div className="mp-float-card second"><Dumbbell size={16}/><span><b>160 g protéines</b><small>Focus performance</small></span></div></div><div className="mp-auth-copy"><span className="mp-eyebrow">LA NUTRITION QUI SUIT TON RYTHME</span><h1>Entraîne-toi.<br/><em>Récupère mieux.</em></h1><p>Des repas adaptés à tes objectifs, un planning réaliste et des courses qui suivent.</p><div className="mp-auth-points"><span><Check size={15}/> Menus personnalisés</span><span><Check size={15}/> Macros & budget</span><span><Check size={15}/> Courses automatiques</span></div></div></div><div className="mp-auth-form-wrap"><div className="mp-auth-form"><span className="mp-eyebrow">BIENVENUE CHEZ MEALPILOT</span><h2>{authMode === "login" ? "Content de te revoir" : "Crée ton espace"}</h2><p className="mp-muted">{authMode === "login" ? "Connecte-toi pour retrouver tes objectifs." : "Quelques infos et on prépare ta semaine."}</p><form onSubmit={authenticate} className="mp-form">{authMode === "register" && <label>Prénom<input value={authName} onChange={e=>setAuthName(e.target.value)} placeholder="Alex"/></label>}<label>Adresse e-mail<input type="email" value={authEmail} onChange={e=>setAuthEmail(e.target.value)} required placeholder="toi@exemple.fr"/></label><label>Mot de passe<input type="password" value={authPassword} onChange={e=>setAuthPassword(e.target.value)} required placeholder="8 caractères minimum"/></label>{authError && <p className="mp-error">{authError}</p>}<button className="mp-btn mp-btn-primary mp-full" type="submit">{authMode === "login" ? <><LogIn size={16}/> Se connecter</> : <>Créer mon compte <ArrowRight size={16}/></>}</button></form><div className="mp-auth-switch">{authMode === "login" ? "Pas encore de compte ?" : "Tu as déjà un compte ?"} <button onClick={()=>{setAuthMode(authMode === "login" ? "register" : "login");setAuthError("")}}>{authMode === "login" ? "Créer un compte" : "Se connecter"}</button></div><div className="mp-demo-box"><div><Sparkles size={17}/><span><b>Explorer la démo</b><small>Compte prérempli avec planning et favoris</small></span></div><button onClick={loginDemo}>Entrer <ArrowRight size={15}/></button><p>Démo : {DEMO_EMAIL} · mot de passe : {DEMO_PASSWORD}</p></div><p className="mp-legal-note"><CircleHelp size={13}/> Version de démonstration : les données sont stockées localement sur cet appareil.</p></div></div></div>;

  return <div className="mp-app"><aside className="mp-sidebar"><button className="mp-brand mp-brand-button" onClick={()=>setView("dashboard")}><span className="mp-brand-icon"><Activity size={23}/></span><span>meal<span>pilot</span><small>FUEL YOUR GOALS</small></span></button><div className="mp-nav-label">MENU PRINCIPAL</div><nav className="mp-nav">{NAV.map(item=>{const Icon=item.icon;return <button key={item.id} className={`mp-nav-item ${view===item.id?"active":""}`} onClick={()=>setView(item.id)}><Icon size={18}/>{item.label}{item.id==="favorites"&&favorites.length>0&&<span className="mp-nav-count">{favorites.length}</span>}</button>})}</nav><div className="mp-sidebar-bottom"><div className="mp-tip-icon"><Target size={19}/></div><b>La régularité fait la différence.</b><p>Un bon plan est celui que tu peux tenir dans la durée.</p><div className="mp-week-progress"><span>Ta semaine</span><b>{Math.round(plannedMeals/28*100)}%</b><div><i style={{width:`${Math.round(plannedMeals/28*100)}%`}}/></div></div></div><div className="mp-sidebar-user"><div className="mp-avatar">{(profile.name||"A").slice(0,1).toUpperCase()}</div><div><b>{profile.name}</b><small>{goalLabel[profile.goal]}</small></div><button title="Déconnexion" onClick={logout}><LogOut size={16}/></button></div><div className="mp-sidebar-foot">MEALPILOT V3 · DEMO</div></aside>
  <main className="mp-main"><header className="mp-topbar"><div><span className="mp-eyebrow">{currentTitle[view].eyebrow}</span><h1>{currentTitle[view].title}</h1></div><div className="mp-topbar-right"><span className="mp-save-indicator"><i/> Données sauvegardées</span><button className="mp-profile-chip" onClick={()=>setView("profile")}><span>{(profile.name||"A").slice(0,1).toUpperCase()}</span><b>{profile.name}</b></button></div></header>
  {recipesLoading && <p className="mp-disclaimer" role="status"><CircleHelp size={14}/> Chargement des recettes depuis l'API…</p>}
  {!recipesLoading && recipesError && <p className="mp-disclaimer" role="status"><CircleHelp size={14}/> {recipesError}</p>}
  {view === "dashboard" && <>
    <section className="mp-hero"><div className="mp-hero-copy"><span className="mp-pill"><Sparkles size={13}/> TON PLAN, TON OBJECTIF</span><h2>Construis ton rythme.<br/><em>Pas juste ton assiette.</em></h2><p>Une stratégie nutrition simple pour progresser à l'entraînement et tenir tes objectifs dans la vraie vie.</p><div className="mp-hero-actions"><button className="mp-btn mp-btn-dark" onClick={()=>setView("planner")}>Voir mon planning <ArrowRight size={15}/></button><button className="mp-btn mp-btn-glass" onClick={generatePlan}><Sparkles size={15}/> Régénérer ma semaine</button></div></div><div className="mp-hero-visual"><div className="mp-ring"><div className="mp-ring-inner"><span>{goalProgress}%</span><small>objectif du jour</small></div></div><div className="mp-ring-caption"><Flame size={17}/><span><b>{fmt(todayMacros.kcal)} / {fmt(targets.calories)}</b><small>kcal consommées</small></span></div><span className="mp-hero-leaf leaf-one">✳</span><span className="mp-hero-leaf leaf-two">✦</span></div></section>
    <div className="mp-section-head"><div><span className="mp-eyebrow">TES REPÈRES</span><h2>Les chiffres qui comptent</h2></div><button className="mp-link-button" onClick={()=>setView("progress")}>Suivi complet <ArrowRight size={14}/></button></div>
    <div className="mp-stats-grid"><article className="mp-stat-card"><div className="mp-stat-top"><span className="mp-stat-icon green"><Flame size={19}/></span><span className="mp-stat-trend"><Target size={13}/> cible</span></div><p>Calories quotidiennes</p><strong>{fmt(targets.calories)} <small>kcal</small></strong><div className="mp-mini-bar"><i style={{width:`${goalProgress}%`}}/></div><small className="mp-stat-foot">{fmt(Math.max(0,targets.calories-todayMacros.kcal))} kcal restantes</small></article><article className="mp-stat-card"><div className="mp-stat-top"><span className="mp-stat-icon orange"><Dumbbell size={19}/></span><span className="mp-stat-trend">protéines</span></div><p>Objectif protéines</p><strong>{targets.protein} <small>g / jour</small></strong><div className="mp-mini-bar orange-bar"><i style={{width:`${Math.min(100,todayMacros.protein/targets.protein*100)}%`}}/></div><small className="mp-stat-foot">{fmt(todayMacros.protein)} g consommés</small></article><article className="mp-stat-card"><div className="mp-stat-top"><span className="mp-stat-icon purple"><CalendarDays size={19}/></span><span className="mp-stat-trend">cette semaine</span></div><p>Repas planifiés</p><strong>{plannedMeals} <small>/ 28</small></strong><div className="mp-mini-bar purple-bar"><i style={{width:`${plannedMeals/28*100}%`}}/></div><small className="mp-stat-foot">4 créneaux par jour</small></article><article className="mp-stat-card"><div className="mp-stat-top"><span className="mp-stat-icon yellow"><Wallet size={19}/></span><span className="mp-stat-trend">estimation</span></div><p>Budget de la semaine</p><strong>{totalCost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})} <small>/ {profile.budget} €</small></strong><div className="mp-mini-bar yellow-bar"><i style={{width:`${Math.min(100,totalCost/Math.max(1,profile.budget)*100)}%`}}/></div><small className="mp-stat-foot">Basé sur les ingrédients du planning</small></article></div>
    <div className="mp-dashboard-grid"><section className="mp-panel mp-today-panel"><div className="mp-panel-head"><div><span className="mp-eyebrow">AU MENU</span><h2>Ta journée type</h2></div><button className="mp-icon-action" onClick={()=>setView("planner")}><ArrowRight size={17}/></button></div><div className="mp-today-list">{MEALS.map(m=>{const id=plan["Lundi"]?.[m.key];const r=recipes.find(x=>x.id===id);return <div className="mp-today-row" key={m.key}><div className="mp-meal-icon">{m.icon}</div><div className="mp-today-meal"><small>{m.label}</small><b>{r?.name||"À planifier"}</b><span>{r?`${r.kcal} kcal · ${r.protein} g protéines`:"Choisis une recette dans ton planning"}</span></div>{r&&<span className="mp-meal-check"><Check size={15}/></span>}</div>})}</div><button className="mp-btn mp-btn-soft mp-full" onClick={()=>setView("planner")}>Modifier ma journée <ArrowRight size={14}/></button></section><section className="mp-panel mp-macro-panel"><div className="mp-panel-head"><div><span className="mp-eyebrow">SUIVI DU JOUR</span><h2>Mes macros</h2></div><span className="mp-small-muted">Démo</span></div><div className="mp-macro-list">{[{label:"Protéines",actual:todayMacros.protein,target:targets.protein,color:"#4f805f",unit:"g"},{label:"Glucides",actual:todayMacros.carbs,target:targets.carbs,color:"#d5a15b",unit:"g"},{label:"Lipides",actual:todayMacros.fat,target:targets.fat,color:"#9a87c7",unit:"g"}].map(m=><div className="mp-macro-row" key={m.label}><div className="mp-macro-label"><span>{m.label}</span><b>{fmt(m.actual)} <small>/ {m.target} {m.unit}</small></b></div><div className="mp-macro-track"><i style={{width:`${Math.min(100,m.actual/Math.max(1,m.target)*100)}%`,background:m.color}}/></div></div>)}</div><div className="mp-tip-box"><Leaf size={17}/><p>Les objectifs sont des estimations de départ. Ajuste-les selon tes sensations et l'évolution de tes performances.</p></div><button className="mp-link-button" onClick={()=>setView("progress")}>Enregistrer mes repas <ArrowRight size={14}/></button></section></div>
    <div className="mp-section-head mp-section-spaced"><div><span className="mp-eyebrow">SÉLECTION POUR TOI</span><h2>À mettre dans ta semaine</h2></div><button className="mp-link-button" onClick={()=>setView("recipes")}>Toutes les recettes <ArrowRight size={14}/></button></div><div className="mp-recipe-grid">{recipes.filter(r=>r.category!=="Collation").slice(0,3).map(r=><RecipeCard key={r.id} recipe={r} favorite={favorites.includes(r.id)} onFavorite={()=>toggleFavorite(r.id)} onPlan={()=>addToPlan(r.id)} onDetails={()=>setSelectedRecipe(r)}/>)}</div>
  </>}
  {(view === "recipes" || view === "favorites") && <><div className="mp-page-intro"><p>{view==="favorites"?"Retrouve les recettes que tu veux refaire.":"Des recettes pensées pour les sportifs : simples, adaptables et chiffrées."}</p></div><div className="mp-recipe-toolbar"><label className="mp-search"><Search size={17}/><input value={query} onChange={e=>setQuery(e.target.value)} placeholder="Chercher un plat, un ingrédient..."/></label><select value={category} onChange={e=>setCategory(e.target.value)}>{categories.map(c=><option key={c}>{c}</option>)}</select><span>{visibleRecipes.length} recettes</span></div>{visibleRecipes.length?<div className="mp-recipe-grid">{visibleRecipes.map(r=><RecipeCard key={r.id} recipe={r} favorite={favorites.includes(r.id)} onFavorite={()=>toggleFavorite(r.id)} onPlan={()=>addToPlan(r.id)} onDetails={()=>setSelectedRecipe(r)}/>)}</div>:<div className="mp-empty"><ChefHat size={30}/><h3>Aucune recette trouvée</h3><p>Modifie les filtres ou ajoute des favoris depuis la bibliothèque.</p><button className="mp-btn mp-btn-soft" onClick={()=>{setQuery("");setCategory("Toutes")}}>Réinitialiser les filtres</button></div>}</>}
  {view === "planner" && <><div className="mp-page-intro mp-planner-intro"><p>28 créneaux sur 7 jours. Génère une semaine adaptée à ton objectif, puis ajuste chaque repas.</p><div className="mp-planner-actions"><button className="mp-btn mp-btn-soft" onClick={()=>{if(window.confirm("Effacer tous les repas du planning ?")){setPlan(blankPlan());notify("Planning effacé.")}}}><X size={15}/> Effacer</button><button className="mp-btn mp-btn-primary" onClick={generatePlan}><Sparkles size={15}/> Générer ma semaine</button></div></div><div className="mp-planner-summary"><div><CalendarDays size={19}/><span><b>{plannedMeals} / 28 créneaux</b><small>{goalLabel[profile.goal]} · {fmt(targets.calories)} kcal/j · Budget estimé : {totalCost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})} / {profile.budget} €</small></span></div><div className="mp-planner-progress"><i style={{width:`${plannedMeals/28*100}%`}}/></div></div><div className="mp-planner-grid">{DAYS.map((day,di)=><section className="mp-day-card" key={day}><div className="mp-day-head"><span>{DAY_SHORT[di]}</span><div><b>{day}</b><small>{MEALS.filter(m=>!!plan[day]?.[m.key]).length}/4 repas</small></div></div>{MEALS.map(m=><div className="mp-planner-slot" key={m.key}><span className="mp-slot-icon">{m.icon}</span><div className="mp-slot-field"><label>{m.label}</label><select value={plan[day]?.[m.key]||""} onChange={e=>setMeal(day,m.key,e.target.value)}><option value="">Choisir une recette</option>{recipes.filter(r=>m.key==="breakfast"?r.category==="Petit-déjeuner":m.key==="lunch"?r.category==="Déjeuner":m.key==="dinner"?r.category==="Dîner":r.category==="Collation").map(r=><option key={r.id} value={r.id}>{r.name}</option>)}</select>{plan[day]?.[m.key]&&(()=>{const r=recipes.find(x=>x.id===plan[day][m.key]);return r?<small>{r.kcal} kcal · {r.protein} g prot.</small>:null})()}</div></div>)}</section>)}</div><p className="mp-disclaimer"><CircleHelp size={14}/> Les calories et macros sont des estimations par portion. Les recettes proposées ne remplacent pas un suivi diététique personnalisé.</p></>}
  {view === "shopping" && <><div className="mp-page-intro"><p>Ta liste se met à jour avec les repas planifiés. Les prix sont des estimations indicatives, pas des prix magasin en temps réel.</p></div><div className="mp-shopping-overview"><div className="mp-shopping-total"><span className="mp-stat-icon green"><ShoppingCart size={20}/></span><div><small>Budget estimé</small><strong>{totalCost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})}</strong><span>Budget cible : {profile.budget} € / semaine</span></div></div><div className="mp-shopping-total"><span className="mp-stat-icon orange"><ClipboardList size={20}/></span><div><small>Articles à acheter</small><strong>{shoppingItems.filter(i=>!checked.includes(i.name.toLocaleLowerCase("fr"))).length}</strong><span>{checked.length} cochés sur {shoppingItems.length}</span></div></div><div className="mp-shopping-total"><span className="mp-stat-icon purple"><Apple size={20}/></span><div><small>Ingrédients disponibles</small><strong>{pantry.length}</strong><span>Dans ton inventaire</span></div></div></div>{shoppingItems.length===0?<div className="mp-empty"><ShoppingCart size={30}/><h3>Ta liste est vide pour l'instant</h3><p>Génère ton planning pour rassembler automatiquement les ingrédients.</p><button className="mp-btn mp-btn-primary" onClick={()=>setView("planner")}>Créer mon planning <ArrowRight size={15}/></button></div>:<div className="mp-shopping-layout"><div className="mp-shopping-groups">{Array.from(new Set(shoppingItems.map(i=>i.category))).map(cat=>{const items=shoppingItems.filter(i=>i.category===cat);return <section className="mp-shopping-group" key={cat}><header><b>{cat}</b><span>{items.filter(i=>checked.includes(i.name.toLocaleLowerCase("fr"))).length}/{items.length}</span></header>{items.map(i=>{const done=checked.includes(i.name.toLocaleLowerCase("fr"));return <label className={`mp-shopping-item ${done?"done":""}`} key={i.name}><input type="checkbox" checked={done} onChange={()=>toggleShopping(i.name)}/><span className="mp-check-custom"><Check size={12}/></span><span className="mp-shopping-name">{i.name}<small>{fmtQty(i.quantity)} {i.unit}</small></span><b>{i.estimatedCost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})}</b><button type="button" title="Marquer comme déjà disponible" className={`mp-pantry-btn ${pantry.includes(i.name)?"active":""}`} onClick={e=>{e.preventDefault();setPantry(p=>p.includes(i.name)?p.filter(x=>x!==i.name):[...p,i.name]);notify(pantry.includes(i.name)?"Ingrédient retiré du placard.":"Ingrédient ajouté au placard.")}}><Apple size={15}/></button></label>})}</section>})}</div><aside className="mp-shopping-aside"><h3>Récapitulatif</h3><div><span>Ingrédients</span><b>{shoppingItems.length}</b></div><div><span>Articles cochés</span><b>{checked.length}</b></div><div><span>Estimation totale</span><b>{totalCost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})}</b></div><div className="mp-budget-meter"><span>Budget hebdomadaire</span><b>{Math.round(totalCost/Math.max(1,profile.budget)*100)}%</b><i><em style={{width:`${Math.min(100,totalCost/Math.max(1,profile.budget)*100)}%`}}/></i></div><button className="mp-btn mp-btn-soft mp-full" onClick={()=>setChecked([])}>Tout décocher</button><button className="mp-btn mp-btn-primary mp-full" onClick={()=>{const text=shoppingItems.map(i=>`${checked.includes(i.name.toLocaleLowerCase("fr"))?"[x]":"[ ]"} ${i.name} — ${fmtQty(i.quantity)} ${i.unit}`).join("\n");navigator.clipboard?.writeText(text).then(()=>notify("Liste copiée."),()=>notify("Copie indisponible dans ce navigateur."))}}>Copier la liste <ClipboardList size={15}/></button></aside></div>}<section className="mp-pantry-box"><div><span className="mp-stat-icon green"><Apple size={18}/></span><div><h3>Mon placard</h3><p>Ajoute les ingrédients déjà chez toi pour les retrouver pendant tes courses.</p></div></div><form onSubmit={e=>{e.preventDefault();const item=newPantry.trim();if(item&&!pantry.includes(item)){setPantry(p=>[...p,item]);notify("Ajouté à ton placard.")}setNewPantry("")}}><input value={newPantry} onChange={e=>setNewPantry(e.target.value)} placeholder="Ex. riz, huile d'olive..."/><button className="mp-btn mp-btn-primary" type="submit"><Plus size={15}/> Ajouter</button></form>{pantry.length>0&&<div className="mp-pantry-tags">{pantry.map(p=><button key={p} onClick={()=>setPantry(items=>items.filter(x=>x!==p))}>{p}<X size={12}/></button>)}</div>}</section></>}
  {view === "progress" && <><div className="mp-page-intro"><p>Coche les repas que tu as réellement consommés pour suivre tes apports. La liste est une démonstration locale et peut être réinitialisée.</p></div><div className="mp-progress-top"><section className="mp-panel mp-calorie-panel"><div className="mp-panel-head"><div><span className="mp-eyebrow">APPORT ÉNERGÉTIQUE</span><h2>Calories du jour</h2></div><Flame size={21}/></div><div className="mp-calorie-number">{fmt(todayMacros.kcal)} <small>/ {fmt(targets.calories)} kcal</small></div><div className="mp-calorie-track"><i style={{width:`${goalProgress}%`}}/></div><div className="mp-calorie-bottom"><span>{goalProgress}% de la cible</span><span>{fmt(Math.max(0,targets.calories-todayMacros.kcal))} kcal restantes</span></div></section><section className="mp-panel mp-goal-panel"><span className="mp-eyebrow">TON OBJECTIF</span><h2>{goalLabel[profile.goal]}</h2><p>{profile.weight} kg · {profile.height} cm · activité {profile.activity}×</p><button className="mp-link-button" onClick={()=>setView("profile")}>Ajuster mon profil <ArrowRight size={14}/></button></section></div><div className="mp-section-head"><div><span className="mp-eyebrow">JOURNÉE DE SUIVI</span><h2>Qu'est-ce que tu as mangé ?</h2></div><button className="mp-btn mp-btn-soft" onClick={()=>setEaten([])}><X size={14}/> Réinitialiser</button></div><div className="mp-log-list">{MEALS.map(m=><section className="mp-log-section" key={m.key}><header><span>{m.icon}</span><b>{m.label}</b><small>{recipes.filter(r=>r.category===(m.key==="breakfast"?"Petit-déjeuner":m.key==="lunch"?"Déjeuner":m.key==="dinner"?"Dîner":"Collation")).length} idées</small></header>{recipes.filter(r=>r.category===(m.key==="breakfast"?"Petit-déjeuner":m.key==="lunch"?"Déjeuner":m.key==="dinner"?"Dîner":"Collation")).map(r=><label className={`mp-log-row ${eaten.includes(r.id)?"logged":""}`} key={r.id}><input type="checkbox" checked={eaten.includes(r.id)} onChange={()=>toggleEaten(r.id)}/><span className="mp-log-check"><Check size={13}/></span><span className="mp-log-emoji">{r.emoji}</span><span className="mp-log-name"><b>{r.name}</b><small>{r.kcal} kcal · P {r.protein} g · G {r.carbs} g · L {r.fat} g</small></span><span className="mp-log-cost">{r.cost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})}</span></label>)}</section>)}</div><p className="mp-disclaimer"><CircleHelp size={14}/> Les recommandations caloriques sont indicatives et ne constituent pas un avis médical. Pour un objectif spécifique ou une condition de santé, fais-toi accompagner par un professionnel qualifié.</p></>}
  {view === "profile" && <><div className="mp-page-intro"><p>Personnalise les calculs et les propositions de repas. Les cibles sont des estimations initiales, pas une prescription médicale.</p></div><form className="mp-profile-layout" onSubmit={e=>{e.preventDefault();setProfileSaved(true);notify("Profil enregistré.")}}><section className="mp-panel mp-profile-form"><div className="mp-panel-head"><div><span className="mp-eyebrow">INFORMATIONS</span><h2>Ton profil sportif</h2></div><UserRound size={20}/></div><div className="mp-fields-grid"><label>Prénom<input value={profile.name} onChange={e=>{setProfile({...profile,name:e.target.value});setProfileSaved(false)}}/></label><label>Âge<input type="number" min="16" max="100" value={profile.age} onChange={e=>{setProfile({...profile,age:Number(e.target.value)});setProfileSaved(false)}}/></label><label>Sexe pour l'estimation<select value={profile.sex} onChange={e=>{setProfile({...profile,sex:e.target.value as AthleteProfile["sex"]});setProfileSaved(false)}}><option value="homme">Homme</option><option value="femme">Femme</option></select></label><label>Taille (cm)<input type="number" min="120" max="230" value={profile.height} onChange={e=>{setProfile({...profile,height:Number(e.target.value)});setProfileSaved(false)}}/></label><label>Poids actuel (kg)<input type="number" min="35" max="300" step="0.1" value={profile.weight} onChange={e=>{setProfile({...profile,weight:Number(e.target.value)});setProfileSaved(false)}}/></label><label>Niveau d'activité<select value={profile.activity} onChange={e=>{setProfile({...profile,activity:Number(e.target.value)});setProfileSaved(false)}}><option value="1.2">Sédentaire</option><option value="1.375">Léger (1–3 séances)</option><option value="1.55">Modéré (3–5 séances)</option><option value="1.725">Élevé (6–7 séances)</option><option value="1.9">Très élevé</option></select></label></div><div className="mp-form-divider"/><span className="mp-eyebrow">TON CAP</span><div className="mp-goal-options">{([{id:"bulk",icon:Dumbbell,title:"Prise de masse",copy:"Léger surplus énergétique"},{id:"cut",icon:ArrowDownRight,title:"Sèche",copy:"Déficit modéré estimé"},{id:"maintain",icon:Activity,title:"Maintien",copy:"Stabiliser tes apports"}] as const).map(g=>{const Icon=g.icon;return <button type="button" key={g.id} className={`mp-goal-option ${profile.goal===g.id?"selected":""}`} onClick={()=>{setProfile({...profile,goal:g.id});setProfileSaved(false)}}><Icon size={20}/><b>{g.title}</b><small>{g.copy}</small>{profile.goal===g.id&&<Check size={15} className="mp-goal-check"/>}</button>})}</div><div className="mp-fields-grid mp-profile-bottom"><label>Budget alimentaire / semaine (€)<input type="number" min="10" max="500" value={profile.budget} onChange={e=>{setProfile({...profile,budget:Number(e.target.value)});setProfileSaved(false)}}/></label><label>Régime alimentaire<select value={profile.diet} onChange={e=>{setProfile({...profile,diet:e.target.value as AthleteProfile["diet"]});setProfileSaved(false)}}><option value="omnivore">Omnivore</option><option value="vegetarien">Végétarien</option><option value="vegan">Végétalien</option></select></label><label className="mp-field-wide">Ingrédients à éviter<input value={profile.avoid} onChange={e=>{setProfile({...profile,avoid:e.target.value});setProfileSaved(false)}} placeholder="Ex. arachides, saumon, lait (séparés par des virgules)"/></label><label>Portions par recette<select value={profile.portions} onChange={e=>{setProfile({...profile,portions:Number(e.target.value)});setProfileSaved(false)}}>{[1,2,3,4,5,6].map(n=><option key={n} value={n}>{n} portion{n>1?"s":""}</option>)}</select></label></div><button className="mp-btn mp-btn-primary" type="submit"><Check size={15}/> {profileSaved?"Profil enregistré":"Enregistrer le profil"}</button></section><aside className="mp-panel mp-targets-card"><span className="mp-eyebrow">TES CIBLES ESTIMÉES</span><h2>{fmt(targets.calories)} <small>kcal / jour</small></h2><p>Estimation calculée à partir de tes informations et de ton objectif.</p><div className="mp-target-line"><span><i className="protein-dot"/>Protéines</span><b>{targets.protein} g</b></div><div className="mp-target-line"><span><i className="carbs-dot"/>Glucides</span><b>{targets.carbs} g</b></div><div className="mp-target-line"><span><i className="fat-dot"/>Lipides</span><b>{targets.fat} g</b></div><div className="mp-target-note"><CircleHelp size={16}/><p>Les besoins varient selon l'entraînement, le sommeil, la santé et la progression. Utilise ces valeurs comme point de départ et ajuste progressivement.</p></div><button type="button" className="mp-btn mp-btn-soft mp-full" onClick={generatePlan}><Sparkles size={15}/> Régénérer le planning</button></aside></form><section className="mp-security-note"><CircleHelp size={17}/><div><b>À propos des comptes et des données</b><p>MealPilot V3 est un prototype. Les comptes créés passent par le backend, mais le profil, le planning et le suivi restent stockés localement dans le navigateur. N'utilise pas de mot de passe réutilisé.</p></div></section></>}
  <footer className="mp-footer"><span>MealPilot <b>·</b> Une routine qui te ressemble.</span><span>Nutrition & entraînement · Version démo</span></footer></main>
  {toast&&<div className="mp-toast" role="status"><Check size={16}/>{toast}</div>}
  {selectedRecipe&&<div className="mp-modal-backdrop" onClick={()=>setSelectedRecipe(null)}><section className="mp-recipe-modal" onClick={e=>e.stopPropagation()}><button className="mp-modal-close" onClick={()=>setSelectedRecipe(null)}><X size={18}/></button><div className="mp-modal-art" style={{background:selectedRecipe.color}}><span>{selectedRecipe.emoji}</span></div><div className="mp-modal-content"><span className="mp-eyebrow">{selectedRecipe.category} · {selectedRecipe.time} MIN</span><h2>{selectedRecipe.name}</h2><p>{selectedRecipe.description}</p><div className="mp-modal-macros"><div><b>{selectedRecipe.kcal}</b><small>kcal</small></div><div><b>{selectedRecipe.protein} g</b><small>Protéines</small></div><div><b>{selectedRecipe.carbs} g</b><small>Glucides</small></div><div><b>{selectedRecipe.fat} g</b><small>Lipides</small></div></div><h3>Ingrédients par portion</h3><ul className="mp-ingredient-list">{selectedRecipe.ingredients.map(i=><li key={i.name}><span>{i.name}</span><b>{i.quantity} {i.unit}</b></li>)}</ul><div className="mp-modal-footer"><span>Coût estimé : <b>{selectedRecipe.cost.toLocaleString("fr-FR",{style:"currency",currency:"EUR"})}</b></span><button className="mp-btn mp-btn-primary" onClick={()=>addToPlan(selectedRecipe.id)}>Ajouter au planning <ArrowRight size={15}/></button></div></div></section></div>}
  </div>;
}
