export type IngredientCategory = "Fruits & légumes" | "Épicerie" | "Frais" | "Viandes" | "Poisson" | "Boulangerie";
export interface Ingredient { name: string; category: IngredientCategory; quantity: number; unit: string; estimatedCost: number; }
export type MealKey = "breakfast" | "lunch" | "dinner" | "snack";
export interface Recipe { id: string; name: string; emoji: string; time: number; category: string; description: string; color: string; kcal: number; protein: number; carbs: number; fat: number; cost: number; ingredients: Ingredient[]; }
export type DayPlan = Record<MealKey, string>;
export type WeeklyPlan = Record<string, DayPlan>;
export type ViewName = "dashboard" | "recipes" | "favorites" | "planner" | "shopping" | "progress" | "profile";
export type Goal = "bulk" | "cut" | "maintain";
export interface AthleteProfile { name: string; age: number; sex: "homme" | "femme"; height: number; weight: number; activity: number; goal: Goal; budget: number; diet: "omnivore" | "vegetarien" | "vegan"; avoid: string; portions: number; }
export interface ShoppingItem { name: string; category: IngredientCategory; quantity: number; unit: string; estimatedCost: number; }
