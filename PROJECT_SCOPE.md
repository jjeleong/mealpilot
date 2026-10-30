# MealPilot V3 — périmètre fonctionnel

## Positionnement

MealPilot est un assistant de nutrition sportive destiné aux personnes qui veulent organiser leurs repas autour d'un objectif de prise de masse, de sèche ou de maintien. Le produit s'inspire des usages des planificateurs nutritionnels existants, mais conserve une marque, une interface et des flux qui lui sont propres.

## Inclus dans cette version

1. **Onboarding et profil** : âge, sexe utilisé pour l'estimation, taille, poids, activité, objectif, régime, ingrédients à éviter, budget et portions.
2. **Calcul de cibles indicatives** : estimation des calories d'entretien, adaptation simple selon l'objectif, répartition des macros.
3. **Catalogue de 80 recettes de démonstration** : petit-déjeuner, déjeuner, dîner et collation ; macros, ingrédients, temps et coût estimatif par portion.
4. **Planning hebdomadaire** : 7 jours × 4 créneaux ; génération automatique filtrée par régime et ingrédients à éviter ; modification manuelle.
5. **Favoris et recherche** : recherche textuelle et filtre de catégories.
6. **Courses** : consolidation des ingrédients du planning, adaptation au nombre de portions, estimation de budget, cases à cocher et copie du texte de la liste.
7. **Placard** : suivi simple des ingrédients disponibles.
8. **Journal de consommation** : sélectionner les recettes consommées et voir le total estimé de calories et macros du jour.
9. **Persistance locale** : compte, profil, planning, favoris, courses, placard et journal sauvegardés dans le navigateur courant.
10. **Responsive** : écrans bureau et mobile.

## Hors périmètre pour cette livraison

- Backend et synchronisation multi-appareils.
- Authentification de production, récupération de mot de passe, confirmation e-mail et gestion des sessions serveur.
- Prix de supermarché en temps réel ou commandes en ligne.
- Garantie d'atteinte exacte des macros et du budget par l'algorithme de menus.
- Import automatique de données de santé ou de montres connectées.
- Historique longitudinal complet, graphes de poids et suivi d'entraînement.
- Conseil médical ou nutritionnel individualisé.

## Critères d'acceptation de la démo

- L'utilisateur peut ouvrir la démo sans créer de compte.
- Il peut consulter et filtrer les recettes, ajouter des favoris et afficher les détails nutritionnels.
- Il peut générer ou modifier les repas de la semaine.
- La liste de courses se met à jour depuis le planning et estime le coût.
- Il peut modifier son objectif sportif et son profil, puis consulter les cibles calculées.
- Il peut cocher les recettes consommées et voir les macros du jour.
- Les données persistent sur le même navigateur après rechargement.

## Évolutions recommandées pour une version en ligne

1. Backend Java/Spring Boot, PostgreSQL et authentification sécurisée.
2. Modèle nutritionnel documenté et source de données alimentaires vérifiable.
3. Optimiseur de planning avec score combinant proximité des macros, budget, variété et temps de cuisine.
4. Historique daté et visualisation de tendances.
5. Intégration de prix via des sources autorisées et actualisées.

## Mise à jour — bibliothèque économique

La bibliothèque de démonstration contient maintenant 80 recettes, dont 64 ajouts répartis entre petit-déjeuner, déjeuner, dîner et collation. Chaque recette ajoutée possède des macros indicatives, des ingrédients quantifiés et un coût estimé par portion. Le générateur du planning prend en compte le budget hebdomadaire et le nombre de portions, favorise les recettes moins chères et pénalise les répétitions. Les prix restent des estimations à remplacer par des données magasin fiables avant une mise en production.


## Extension SQL / backend (édition full-stack)
- PostgreSQL avec tables utilisateurs, profils sportifs, recettes, ingrédients, favoris, plannings, repas planifiés, journal nutritionnel et listes de courses.
- API REST Java/Spring Boot avec endpoints de santé, inscription/connexion, profils, recettes, favoris, plannings et journal alimentaire.
- 80 recettes et leurs ingrédients importés dans `backend/src/main/resources/db/seed-recipes.sql`.
- Client API ajouté dans `src/services/api.ts`. Le frontend historique reste en mode local tant que l'intégration des écrans n'est pas activée.
