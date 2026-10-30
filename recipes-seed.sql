BEGIN;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'overnight',
         'Overnight oats protéinés',
         '🥣',
         5,
         'Petit-déjeuner',
         'La veille au soir, prépare un petit-déjeuner crémeux et pratique.',
         '#e9e4d7',
         450,
         32,
         58,
         11,
         2.15,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight',
  ing.id,
  60,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight',
  ing.id,
  200,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight',
  ing.id,
  200,
  'ml',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight',
  ing.id,
  15,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'omelette',
         'Omelette complète & tartines',
         '🍳',
         15,
         'Petit-déjeuner',
         'Un classique riche en protéines, avec des glucides pour démarrer.',
         '#f5e5cf',
         510,
         34,
         43,
         22,
         1.62,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièces',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette',
  ing.id,
  2,
  'pièces',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette',
  ing.id,
  80,
  'g',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards',
    'Fruits & légumes',
    'g',
    0.42
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette',
  ing.id,
  60,
  'g',
  0.42
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Emmental',
    'Frais',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette',
  ing.id,
  20,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'pancakes',
         'Pancakes banane-protéines',
         '🥞',
         18,
         'Petit-déjeuner',
         'Des pancakes moelleux pour les matins où tu as besoin d’énergie.',
         '#f2dfce',
         520,
         35,
         67,
         12,
         2.37,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pancakes',
  ing.id,
  60,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièces',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pancakes',
  ing.id,
  2,
  'pièces',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pancakes',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pancakes',
  ing.id,
  200,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chicken-rice',
         'Poulet, riz & légumes',
         '🍗',
         25,
         'Déjeuner',
         'Un plat simple à préparer en avance, équilibré et facile à portionner.',
         '#dfead8',
         620,
         48,
         76,
         12,
         2.86,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poulet',
    'Viandes',
    'g',
    1.92
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-rice',
  ing.id,
  160,
  'g',
  1.92
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz basmati',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-rice',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Brocoli',
    'Fruits & légumes',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-rice',
  ing.id,
  150,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-rice',
  ing.id,
  8,
  'ml',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'salmon',
         'Saumon, pommes de terre & haricots',
         '🐟',
         30,
         'Déjeuner',
         'Des protéines, des glucides et des bons lipides dans une assiette complète.',
         '#f4dfdc',
         670,
         42,
         62,
         25,
         5.62,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Saumon',
    'Poisson',
    'g',
    4.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'salmon',
  ing.id,
  150,
  'g',
  4.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'salmon',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Haricots verts',
    'Fruits & légumes',
    'g',
    0.75
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'salmon',
  ing.id,
  150,
  'g',
  0.75
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Citron',
    'Fruits & légumes',
    'pièce',
    0.17
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'salmon',
  ing.id,
  0.5,
  'pièce',
  0.17
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'bowl',
         'Bowl bœuf, quinoa & avocat',
         '🥑',
         25,
         'Déjeuner',
         'Un bowl nourrissant avec une bonne variété de textures.',
         '#dfeee0',
         690,
         43,
         70,
         24,
         4.38,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Bœuf haché 5%',
    'Viandes',
    'g',
    2.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bowl',
  ing.id,
  150,
  'g',
  2.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Quinoa',
    'Épicerie',
    'g',
    0.63
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bowl',
  ing.id,
  70,
  'g',
  0.63
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Avocat',
    'Fruits & légumes',
    'pièce',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bowl',
  ing.id,
  0.5,
  'pièce',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.75
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bowl',
  ing.id,
  150,
  'g',
  0.75
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'lentils',
         'Dahl de lentilles & riz',
         '🍛',
         30,
         'Déjeuner',
         'Une option végétarienne économique, rassasiante et riche en fibres.',
         '#f6e5c9',
         590,
         25,
         88,
         12,
         1.38,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lentilles corail',
    'Épicerie',
    'g',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentils',
  ing.id,
  80,
  'g',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz basmati',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentils',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait de coco léger',
    'Épicerie',
    'ml',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentils',
  ing.id,
  100,
  'ml',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards',
    'Fruits & légumes',
    'g',
    0.42
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentils',
  ing.id,
  60,
  'g',
  0.42
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'wrap',
         'Wrap poulet & crudités',
         '🌯',
         15,
         'Déjeuner',
         'Facile à emporter, avec une sauce au yaourt légère.',
         '#f4e8d2',
         540,
         42,
         58,
         14,
         4.29,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tortillas complètes',
    'Épicerie',
    'pièces',
    0.9
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'wrap',
  ing.id,
  2,
  'pièces',
  0.9
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poulet',
    'Viandes',
    'g',
    1.92
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'wrap',
  ing.id,
  160,
  'g',
  1.92
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Yaourt grec',
    'Frais',
    'g',
    0.48
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'wrap',
  ing.id,
  80,
  'g',
  0.48
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Salade',
    'Fruits & légumes',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'wrap',
  ing.id,
  40,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.75
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'wrap',
  ing.id,
  150,
  'g',
  0.75
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'pasta',
         'Pâtes au thon et tomate',
         '🍝',
         20,
         'Dîner',
         'Un dîner rapide avec des ingrédients faciles à garder au placard.',
         '#f7e4d6',
         610,
         39,
         78,
         13,
         1.98,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.23
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta',
  ing.id,
  90,
  'g',
  0.23
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Thon au naturel',
    'Poisson',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta',
  ing.id,
  100,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates concassées',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta',
  ing.id,
  150,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Parmesan',
    'Frais',
    'g',
    0.25
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta',
  ing.id,
  10,
  'g',
  0.25
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chili',
         'Chili de dinde & haricots rouges',
         '🌶️',
         30,
         'Dîner',
         'Un plat mijoté qui se conserve bien pour le batch cooking.',
         '#f2dfd7',
         570,
         46,
         62,
         13,
         2.61,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Dinde hachée',
    'Viandes',
    'g',
    1.8
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili',
  ing.id,
  150,
  'g',
  1.8
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Haricots rouges',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili',
  ing.id,
  100,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates concassées',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili',
  ing.id,
  150,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.21
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili',
  ing.id,
  70,
  'g',
  0.21
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tofu',
         'Tofu croustillant & nouilles',
         '🥢',
         25,
         'Dîner',
         'Une alternative végétale avec une sauce soja-gingembre.',
         '#e5e9d8',
         590,
         31,
         74,
         18,
         1.88,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu ferme',
    'Frais',
    'g',
    1.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu',
  ing.id,
  150,
  'g',
  1.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Nouilles de blé',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu',
  ing.id,
  100,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.09
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu',
  ing.id,
  15,
  'ml',
  0.09
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'omelet-dinner',
         'Frittata pommes de terre & épinards',
         '🍽️',
         25,
         'Dîner',
         'Un repas économique qui utilise les ingrédients du quotidien.',
         '#f3e8d0',
         480,
         29,
         42,
         21,
         1.92,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièces',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelet-dinner',
  ing.id,
  2,
  'pièces',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelet-dinner',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards',
    'Fruits & légumes',
    'g',
    0.42
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelet-dinner',
  ing.id,
  60,
  'g',
  0.42
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Feta',
    'Frais',
    'g',
    0.36
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelet-dinner',
  ing.id,
  30,
  'g',
  0.36
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'skyr',
         'Skyr, fruits rouges & granola',
         '🍓',
         5,
         'Collation',
         'Une collation rapide à ajuster selon tes besoins énergétiques.',
         '#f5e3eb',
         280,
         25,
         31,
         6,
         2.67,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr',
  ing.id,
  200,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fruits rouges',
    'Fruits & légumes',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr',
  ing.id,
  100,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Granola',
    'Épicerie',
    'g',
    0.27
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr',
  ing.id,
  30,
  'g',
  0.27
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'shake',
         'Smoothie banane-cacao',
         '🥤',
         5,
         'Collation',
         'Une boisson pratique après une séance ou en complément du goûter.',
         '#e7e1f2',
         330,
         24,
         45,
         7,
         0.87,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shake',
  ing.id,
  200,
  'ml',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shake',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cacao non sucré',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shake',
  ing.id,
  5,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shake',
  ing.id,
  15,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'cottage',
         'Tartines cottage cheese',
         '🥪',
         8,
         'Collation',
         'Une option salée riche en protéines, sans préparation compliquée.',
         '#e1eee7',
         300,
         26,
         34,
         7,
         1.76,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage',
  ing.id,
  80,
  'g',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cottage cheese',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage',
  ing.id,
  150,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Concombre',
    'Fruits & légumes',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'energy',
         'Boulettes avoine-dattes',
         '🍫',
         12,
         'Collation',
         'Petites bouchées énergétiques à préparer pour plusieurs jours.',
         '#eadfd4',
         240,
         8,
         35,
         8,
         0.7,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'energy',
  ing.id,
  60,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Dattes',
    'Fruits & légumes',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'energy',
  ing.id,
  30,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'energy',
  ing.id,
  15,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cacao non sucré',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'energy',
  ing.id,
  5,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'porridge-apple',
         'Porridge pomme-cannelle',
         '🥣',
         8,
         'Petit-déjeuner',
         'Un petit-déjeuner chaud avec des ingrédients de placard.',
         '#e9e4d7',
         390,
         20,
         62,
         8,
         1.11,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'porridge-apple',
  ing.id,
  60,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'porridge-apple',
  ing.id,
  200,
  'ml',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pomme',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'porridge-apple',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.28
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'porridge-apple',
  ing.id,
  80,
  'g',
  0.28
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'skyr-bowl',
         'Bol skyr, avoine et fruits rouges',
         '🫐',
         5,
         'Petit-déjeuner',
         'Très riche en protéines, prêt en quelques minutes.',
         '#e1eee7',
         360,
         30,
         48,
         6,
         2.27,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr-bowl',
  ing.id,
  200,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr-bowl',
  ing.id,
  40,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fruits rouges surgelés',
    'Fruits & légumes',
    'g',
    0.9
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr-bowl',
  ing.id,
  100,
  'g',
  0.9
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Miel',
    'Épicerie',
    'g',
    0.05
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr-bowl',
  ing.id,
  5,
  'g',
  0.05
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'egg-toast',
         'Œufs brouillés sur pain complet',
         '🍳',
         10,
         'Petit-déjeuner',
         'Simple, rassasiant et économique.',
         '#f5e5cf',
         410,
         25,
         37,
         17,
         1.2,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-toast',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.36
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-toast',
  ing.id,
  90,
  'g',
  0.36
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-toast',
  ing.id,
  50,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'banana-oat-pancake',
         'Pancakes avoine-banane économiques',
         '🥞',
         15,
         'Petit-déjeuner',
         'Une recette sans whey, idéale avant l’entraînement.',
         '#f2dfce',
         430,
         20,
         67,
         10,
         0.92,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-oat-pancake',
  ing.id,
  60,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-oat-pancake',
  ing.id,
  1,
  'pièce',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-oat-pancake',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-oat-pancake',
  ing.id,
  50,
  'ml',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'cottage-toast',
         'Tartines cottage cheese et tomate',
         '🥪',
         7,
         'Petit-déjeuner',
         'Une option salée avec des protéines et des légumes.',
         '#e1eee7',
         330,
         25,
         39,
         8,
         1.52,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-toast',
  ing.id,
  80,
  'g',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cottage cheese',
    'Frais',
    'g',
    0.8
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-toast',
  ing.id,
  100,
  'g',
  0.8
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-toast',
  ing.id,
  80,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'overnight-cacao',
         'Overnight oats cacao-banane',
         '🍫',
         5,
         'Petit-déjeuner',
         'À préparer la veille pour gagner du temps le matin.',
         '#eadfd4',
         440,
         25,
         65,
         10,
         1.22,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight-cacao',
  ing.id,
  60,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.27
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight-cacao',
  ing.id,
  180,
  'ml',
  0.27
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight-cacao',
  ing.id,
  100,
  'g',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight-cacao',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cacao non sucré',
    'Épicerie',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'overnight-cacao',
  ing.id,
  5,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'fromage-blanc-muesli',
         'Fromage blanc, muesli et pomme',
         '🍎',
         4,
         'Petit-déjeuner',
         'Un bol rapide qui utilise des ingrédients faciles à trouver.',
         '#e9e4d7',
         370,
         24,
         54,
         7,
         1.41,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.88
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fromage-blanc-muesli',
  ing.id,
  250,
  'g',
  0.88
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fromage-blanc-muesli',
  ing.id,
  35,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pomme',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fromage-blanc-muesli',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Raisins secs',
    'Fruits & légumes',
    'g',
    0.08
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fromage-blanc-muesli',
  ing.id,
  10,
  'g',
  0.08
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'omelette-champignons',
         'Omelette aux champignons et tartine',
         '🍄',
         12,
         'Petit-déjeuner',
         'Petit-déjeuner salé avec des légumes et du pain complet.',
         '#f5e5cf',
         390,
         25,
         32,
         16,
         1.6,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette-champignons',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Champignons',
    'Fruits & légumes',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette-champignons',
  ing.id,
  100,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Emmental râpé',
    'Frais',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette-champignons',
  ing.id,
  10,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'omelette-champignons',
  ing.id,
  60,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'yogurt-peanut-banana',
         'Bol yaourt, banane et cacahuète',
         '🥜',
         4,
         'Petit-déjeuner',
         'Une option énergétique à petit prix.',
         '#f4dfdc',
         400,
         22,
         51,
         13,
         1.22,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.7
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'yogurt-peanut-banana',
  ing.id,
  200,
  'g',
  0.7
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'yogurt-peanut-banana',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'yogurt-peanut-banana',
  ing.id,
  12,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'yogurt-peanut-banana',
  ing.id,
  25,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'french-toast',
         'Pain perdu protéiné',
         '🍞',
         12,
         'Petit-déjeuner',
         'Utilise du pain de la veille pour limiter le gaspillage.',
         '#f2dfce',
         420,
         25,
         54,
         11,
         1.43,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.36
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'french-toast',
  ing.id,
  90,
  'g',
  0.36
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'french-toast',
  ing.id,
  1,
  'pièce',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.15
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'french-toast',
  ing.id,
  100,
  'ml',
  0.15
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'french-toast',
  ing.id,
  100,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'pita-egg',
         'Pita aux œufs et épinards',
         '🥙',
         12,
         'Petit-déjeuner',
         'Un sandwich chaud pratique à emporter.',
         '#dfead8',
         390,
         23,
         43,
         13,
         1.33,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain pita',
    'Boulangerie',
    'pièce',
    0.45
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pita-egg',
  ing.id,
  1,
  'pièce',
  0.45
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pita-egg',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pita-egg',
  ing.id,
  60,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'semolina-milk',
         'Semoule au lait et raisins',
         '🥣',
         10,
         'Petit-déjeuner',
         'Une recette douce et économique pour augmenter les glucides.',
         '#e9e4d7',
         360,
         17,
         63,
         5,
         0.9,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Semoule complète',
    'Épicerie',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'semolina-milk',
  ing.id,
  50,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.38
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'semolina-milk',
  ing.id,
  250,
  'ml',
  0.38
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Raisins secs',
    'Fruits & légumes',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'semolina-milk',
  ing.id,
  15,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.28
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'semolina-milk',
  ing.id,
  80,
  'g',
  0.28
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tofu-scramble',
         'Tofu brouillé et tartines',
         '🌱',
         12,
         'Petit-déjeuner',
         'Petit-déjeuner végétal avec une bonne part de protéines.',
         '#dfeee0',
         390,
         25,
         38,
         15,
         1.48,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu nature',
    'Frais',
    'g',
    0.96
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-scramble',
  ing.id,
  120,
  'g',
  0.96
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-scramble',
  ing.id,
  80,
  'g',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-scramble',
  ing.id,
  50,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'ricecakes-cottage',
         'Galettes de riz au cottage cheese',
         '🍘',
         5,
         'Petit-déjeuner',
         'Léger et rapide quand le temps manque.',
         '#e1eee7',
         290,
         23,
         34,
         6,
         1.92,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Galettes de riz',
    'Épicerie',
    'pièce',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'ricecakes-cottage',
  ing.id,
  4,
  'pièce',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cottage cheese',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'ricecakes-cottage',
  ing.id,
  150,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'ricecakes-cottage',
  ing.id,
  80,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'pear-oat-bowl',
         'Porridge poire et yaourt',
         '🍐',
         8,
         'Petit-déjeuner',
         'Une alternative simple au porridge classique.',
         '#f2dfce',
         380,
         21,
         60,
         7,
         1.12,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.17
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pear-oat-bowl',
  ing.id,
  55,
  'g',
  0.17
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.27
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pear-oat-bowl',
  ing.id,
  180,
  'ml',
  0.27
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poire',
    'Fruits & légumes',
    'pièce',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pear-oat-bowl',
  ing.id,
  1,
  'pièce',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.28
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pear-oat-bowl',
  ing.id,
  80,
  'g',
  0.28
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'savory-oats',
         'Porridge salé aux œufs',
         '🍳',
         10,
         'Petit-déjeuner',
         'Avoine, œufs et épinards pour changer des petits-déjeuners sucrés.',
         '#dfead8',
         370,
         23,
         42,
         12,
         1.03,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.15
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'savory-oats',
  ing.id,
  50,
  'g',
  0.15
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'savory-oats',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'savory-oats',
  ing.id,
  60,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'lentil-rice',
         'Dahl de lentilles et riz',
         '🍛',
         25,
         'Déjeuner',
         'Une base végétarienne très économique, riche en fibres.',
         '#dfeee0',
         560,
         25,
         91,
         8,
         0.8,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lentilles sèches',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-rice',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-rice',
  ing.id,
  70,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-rice',
  ing.id,
  100,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-rice',
  ing.id,
  50,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.06
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-rice',
  ing.id,
  5,
  'ml',
  0.06
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tuna-pasta',
         'Pâtes au thon et tomate',
         '🍝',
         18,
         'Déjeuner',
         'Un repas riche en protéines avec des ingrédients de placard.',
         '#f4dfdc',
         560,
         38,
         76,
         10,
         1.74,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.23
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-pasta',
  ing.id,
  90,
  'g',
  0.23
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Thon au naturel égoutté',
    'Poisson',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-pasta',
  ing.id,
  100,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-pasta',
  ing.id,
  120,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-pasta',
  ing.id,
  30,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chili-beans-rice',
         'Chili sin carne et riz',
         '🌶️',
         22,
         'Déjeuner',
         'Un plat végétal facile à cuisiner en plusieurs portions.',
         '#f2dfce',
         590,
         22,
         98,
         9,
         1.29,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Haricots rouges en conserve',
    'Épicerie',
    'g',
    0.53
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili-beans-rice',
  ing.id,
  150,
  'g',
  0.53
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili-beans-rice',
  ing.id,
  70,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili-beans-rice',
  ing.id,
  150,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Maïs en conserve',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili-beans-rice',
  ing.id,
  50,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chili-beans-rice',
  ing.id,
  40,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'turkey-pasta',
         'Pâtes à la dinde et tomate',
         '🍝',
         20,
         'Déjeuner',
         'Une alternative à petit prix aux plats de viande plus chers.',
         '#dfead8',
         610,
         43,
         78,
         12,
         2.49,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.23
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-pasta',
  ing.id,
  90,
  'g',
  0.23
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Dinde',
    'Viandes',
    'g',
    1.82
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-pasta',
  ing.id,
  130,
  'g',
  1.82
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-pasta',
  ing.id,
  120,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-pasta',
  ing.id,
  50,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tofu-rice-bowl',
         'Bowl tofu, riz et légumes',
         '🥗',
         20,
         'Déjeuner',
         'Une assiette végétale complète, adaptable avec les légumes surgelés.',
         '#dfeee0',
         550,
         25,
         75,
         15,
         2.15,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu nature',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-rice-bowl',
  ing.id,
  150,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.19
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-rice-bowl',
  ing.id,
  75,
  'g',
  0.19
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.72
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-rice-bowl',
  ing.id,
  180,
  'g',
  0.72
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.04
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-rice-bowl',
  ing.id,
  10,
  'ml',
  0.04
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chickpea-couscous',
         'Couscous pois chiches et légumes',
         '🥘',
         20,
         'Déjeuner',
         'Très économique et facile à préparer en grande quantité.',
         '#e9e4d7',
         570,
         22,
         94,
         10,
         1.08,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Semoule complète',
    'Épicerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-couscous',
  ing.id,
  80,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pois chiches en conserve',
    'Épicerie',
    'g',
    0.46
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-couscous',
  ing.id,
  130,
  'g',
  0.46
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-couscous',
  ing.id,
  100,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.16
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-couscous',
  ing.id,
  80,
  'g',
  0.16
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.06
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-couscous',
  ing.id,
  5,
  'ml',
  0.06
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'egg-fried-rice',
         'Riz sauté aux œufs et légumes',
         '🍚',
         15,
         'Déjeuner',
         'Parfait pour utiliser du riz déjà cuit et des légumes surgelés.',
         '#f5e5cf',
         520,
         23,
         75,
         13,
         1.48,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-fried-rice',
  ing.id,
  80,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-fried-rice',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-fried-rice',
  ing.id,
  150,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.04
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-fried-rice',
  ing.id,
  10,
  'ml',
  0.04
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'potato-tuna-salad',
         'Salade pommes de terre et thon',
         '🥔',
         20,
         'Déjeuner',
         'Une salade froide rassasiante, adaptée au batch cooking.',
         '#dfead8',
         490,
         35,
         58,
         11,
         2.09,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'potato-tuna-salad',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Thon au naturel égoutté',
    'Poisson',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'potato-tuna-salad',
  ing.id,
  100,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Yaourt nature',
    'Frais',
    'g',
    0.15
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'potato-tuna-salad',
  ing.id,
  50,
  'g',
  0.15
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Concombre',
    'Fruits & légumes',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'potato-tuna-salad',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'lentil-bolognese',
         'Bolognaise de lentilles',
         '🍝',
         25,
         'Déjeuner',
         'Une sauce riche et économique pour les pâtes complètes.',
         '#f2dfce',
         560,
         27,
         92,
         8,
         0.91,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lentilles sèches',
    'Épicerie',
    'g',
    0.21
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-bolognese',
  ing.id,
  70,
  'g',
  0.21
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-bolognese',
  ing.id,
  80,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-bolognese',
  ing.id,
  150,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-bolognese',
  ing.id,
  50,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-bolognese',
  ing.id,
  40,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chicken-wrap',
         'Wrap poulet, yaourt et crudités',
         '🌯',
         15,
         'Déjeuner',
         'Un déjeuner transportable avec une sauce légère.',
         '#e1eee7',
         500,
         38,
         48,
         14,
         2.34,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tortilla de blé',
    'Épicerie',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-wrap',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poulet',
    'Viandes',
    'g',
    1.44
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-wrap',
  ing.id,
  120,
  'g',
  1.44
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Yaourt nature',
    'Frais',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-wrap',
  ing.id,
  40,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Salade',
    'Fruits & légumes',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-wrap',
  ing.id,
  30,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.25
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-wrap',
  ing.id,
  50,
  'g',
  0.25
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'sardine-potato',
         'Sardines et pommes de terre citronnées',
         '🐟',
         18,
         'Déjeuner',
         'Les sardines en conserve offrent une option économique riche en oméga-3.',
         '#f4dfdc',
         530,
         30,
         55,
         19,
         1.89,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sardines en conserve',
    'Poisson',
    'g',
    0.9
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'sardine-potato',
  ing.id,
  100,
  'g',
  0.9
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'sardine-potato',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Citron',
    'Fruits & légumes',
    'pièce',
    0.17
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'sardine-potato',
  ing.id,
  0.5,
  'pièce',
  0.17
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'sardine-potato',
  ing.id,
  80,
  'g',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'beef-bulgur',
         'Bœuf haché et boulgour aux tomates',
         '🥘',
         20,
         'Déjeuner',
         'Une portion contrôlée de bœuf avec une céréale abordable.',
         '#f2dfce',
         600,
         37,
         69,
         18,
         3,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Bœuf haché 5%',
    'Viandes',
    'g',
    2.16
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-bulgur',
  ing.id,
  120,
  'g',
  2.16
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Boulgour',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-bulgur',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-bulgur',
  ing.id,
  100,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-bulgur',
  ing.id,
  40,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'whitefish-rice',
         'Colin, riz et brocoli',
         '🐟',
         25,
         'Déjeuner',
         'Poisson surgelé et légumes pour limiter le coût du plat.',
         '#dfead8',
         510,
         38,
         69,
         8,
         2.72,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Filet de colin surgelé',
    'Poisson',
    'g',
    1.8
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'whitefish-rice',
  ing.id,
  150,
  'g',
  1.8
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.19
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'whitefish-rice',
  ing.id,
  75,
  'g',
  0.19
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Brocoli surgelé',
    'Fruits & légumes',
    'g',
    0.67
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'whitefish-rice',
  ing.id,
  150,
  'g',
  0.67
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.06
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'whitefish-rice',
  ing.id,
  5,
  'ml',
  0.06
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tofu-noodles',
         'Nouilles de riz au tofu et légumes',
         '🍜',
         20,
         'Déjeuner',
         'Une recette végétale inspirée des sautés asiatiques.',
         '#dfeee0',
         560,
         25,
         82,
         14,
         2.02,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu nature',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-noodles',
  ing.id,
  150,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-noodles',
  ing.id,
  70,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-noodles',
  ing.id,
  150,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.04
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-noodles',
  ing.id,
  10,
  'ml',
  0.04
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'bean-quesadilla',
         'Quesadilla haricots rouges et fromage',
         '🫓',
         12,
         'Déjeuner',
         'Un repas rapide avec fibres et protéines, à servir avec une salade.',
         '#f5e5cf',
         520,
         25,
         60,
         18,
         1.27,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tortilla de blé',
    'Épicerie',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-quesadilla',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Haricots rouges en conserve',
    'Épicerie',
    'g',
    0.42
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-quesadilla',
  ing.id,
  120,
  'g',
  0.42
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Emmental râpé',
    'Frais',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-quesadilla',
  ing.id,
  25,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Salsa tomate',
    'Épicerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-quesadilla',
  ing.id,
  40,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chicken-couscous',
         'Poulet et semoule aux légumes',
         '🍗',
         22,
         'Déjeuner',
         'Une recette simple à préparer en plusieurs boîtes repas.',
         '#dfead8',
         610,
         42,
         82,
         11,
         2.5,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poulet',
    'Viandes',
    'g',
    1.68
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-couscous',
  ing.id,
  140,
  'g',
  1.68
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Semoule complète',
    'Épicerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-couscous',
  ing.id,
  80,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.16
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-couscous',
  ing.id,
  80,
  'g',
  0.16
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-couscous',
  ing.id,
  100,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.06
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-couscous',
  ing.id,
  5,
  'ml',
  0.06
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'lentil-soup-toast',
         'Soupe de lentilles et tartines',
         '🍲',
         25,
         'Dîner',
         'Un dîner très abordable, nourrissant et facile à congeler.',
         '#e9e4d7',
         470,
         25,
         68,
         9,
         0.73,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lentilles sèches',
    'Épicerie',
    'g',
    0.21
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-soup-toast',
  ing.id,
  70,
  'g',
  0.21
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-soup-toast',
  ing.id,
  100,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-soup-toast',
  ing.id,
  50,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-soup-toast',
  ing.id,
  50,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tofu-curry',
         'Curry de tofu et riz',
         '🍛',
         25,
         'Dîner',
         'Un plat végétal crémeux sans viande ni poisson.',
         '#dfeee0',
         590,
         27,
         78,
         18,
         2.27,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu nature',
    'Frais',
    'g',
    1.28
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-curry',
  ing.id,
  160,
  'g',
  1.28
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.19
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-curry',
  ing.id,
  75,
  'g',
  0.19
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait de coco léger',
    'Épicerie',
    'ml',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-curry',
  ing.id,
  80,
  'ml',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâte de curry',
    'Épicerie',
    'g',
    0.08
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-curry',
  ing.id,
  8,
  'g',
  0.08
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-curry',
  ing.id,
  100,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'pasta-egg-spinach',
         'Pâtes aux œufs et épinards',
         '🍝',
         18,
         'Dîner',
         'Une recette de placard simple avec des protéines et des légumes.',
         '#dfead8',
         520,
         26,
         72,
         14,
         1.37,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.21
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta-egg-spinach',
  ing.id,
  85,
  'g',
  0.21
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta-egg-spinach',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta-egg-spinach',
  ing.id,
  100,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Emmental râpé',
    'Frais',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pasta-egg-spinach',
  ing.id,
  10,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chicken-potato-tray',
         'Poulet et pommes de terre au four',
         '🍗',
         35,
         'Dîner',
         'Un plat à four pratique qui demande peu de surveillance.',
         '#f2dfce',
         590,
         42,
         58,
         17,
         2.6,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poulet',
    'Viandes',
    'g',
    1.8
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-potato-tray',
  ing.id,
  150,
  'g',
  1.8
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-potato-tray',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-potato-tray',
  ing.id,
  100,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-potato-tray',
  ing.id,
  8,
  'ml',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'bean-tomato-stew',
         'Ragoût haricots rouges et pommes de terre',
         '🥘',
         25,
         'Dîner',
         'Un dîner végétal à faible coût par portion.',
         '#dfeee0',
         510,
         21,
         83,
         9,
         1.27,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Haricots rouges en conserve',
    'Épicerie',
    'g',
    0.53
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-tomato-stew',
  ing.id,
  150,
  'g',
  0.53
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-tomato-stew',
  ing.id,
  200,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-tomato-stew',
  ing.id,
  120,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'bean-tomato-stew',
  ing.id,
  40,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'turkey-rice-tomato',
         'Dinde tomate et riz',
         '🍅',
         22,
         'Dîner',
         'Une recette maigre, riche en protéines et facile à portionner.',
         '#dfead8',
         560,
         43,
         72,
         9,
         2.79,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Dinde',
    'Viandes',
    'g',
    1.96
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-rice-tomato',
  ing.id,
  140,
  'g',
  1.96
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.19
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-rice-tomato',
  ing.id,
  75,
  'g',
  0.19
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-rice-tomato',
  ing.id,
  120,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'turkey-rice-tomato',
  ing.id,
  100,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chickpea-spinach-curry',
         'Curry pois chiches-épinards',
         '🌱',
         20,
         'Dîner',
         'Un plat végétarien économique à servir avec du riz.',
         '#dfeee0',
         540,
         22,
         80,
         15,
         1.37,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pois chiches en conserve',
    'Épicerie',
    'g',
    0.53
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-spinach-curry',
  ing.id,
  150,
  'g',
  0.53
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-spinach-curry',
  ing.id,
  100,
  'g',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait de coco léger',
    'Épicerie',
    'ml',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-spinach-curry',
  ing.id,
  60,
  'ml',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.15
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-spinach-curry',
  ing.id,
  60,
  'g',
  0.15
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâte de curry',
    'Épicerie',
    'g',
    0.05
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chickpea-spinach-curry',
  ing.id,
  5,
  'g',
  0.05
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tuna-potato-gratin',
         'Gratin léger thon et pommes de terre',
         '🥔',
         30,
         'Dîner',
         'Un plat familial qui se prépare avec des ingrédients simples.',
         '#f4dfdc',
         520,
         36,
         57,
         14,
         2.16,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-potato-gratin',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Thon au naturel égoutté',
    'Poisson',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-potato-gratin',
  ing.id,
  100,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.28
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-potato-gratin',
  ing.id,
  80,
  'g',
  0.28
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Emmental râpé',
    'Frais',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-potato-gratin',
  ing.id,
  15,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'beef-tomato-pasta',
         'Pâtes bolognaise express',
         '🍝',
         22,
         'Dîner',
         'Une version simple de la bolognaise avec une portion mesurée de viande.',
         '#f2dfce',
         620,
         36,
         80,
         16,
         2.4,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.23
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-tomato-pasta',
  ing.id,
  90,
  'g',
  0.23
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Bœuf haché 5%',
    'Viandes',
    'g',
    1.8
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-tomato-pasta',
  ing.id,
  100,
  'g',
  1.8
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-tomato-pasta',
  ing.id,
  150,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'beef-tomato-pasta',
  ing.id,
  30,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'shakshuka-beans',
         'Shakshuka aux haricots',
         '🍳',
         20,
         'Dîner',
         'Œufs, tomate et haricots pour un dîner économique.',
         '#f5e5cf',
         480,
         26,
         49,
         18,
         1.52,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.64
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shakshuka-beans',
  ing.id,
  2,
  'pièce',
  0.64
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Haricots rouges en conserve',
    'Épicerie',
    'g',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shakshuka-beans',
  ing.id,
  100,
  'g',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Coulis de tomate',
    'Épicerie',
    'g',
    0.3
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shakshuka-beans',
  ing.id,
  150,
  'g',
  0.3
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.16
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shakshuka-beans',
  ing.id,
  40,
  'g',
  0.16
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'shakshuka-beans',
  ing.id,
  30,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'fish-couscous',
         'Colin et semoule aux légumes',
         '🐟',
         25,
         'Dîner',
         'Un dîner léger et protéiné avec du poisson surgelé.',
         '#dfead8',
         500,
         38,
         68,
         7,
         2.87,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Filet de colin surgelé',
    'Poisson',
    'g',
    1.8
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fish-couscous',
  ing.id,
  150,
  'g',
  1.8
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Semoule complète',
    'Épicerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fish-couscous',
  ing.id,
  70,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.72
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fish-couscous',
  ing.id,
  180,
  'g',
  0.72
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Citron',
    'Fruits & légumes',
    'pièce',
    0.17
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'fish-couscous',
  ing.id,
  0.5,
  'pièce',
  0.17
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tofu-peanut-noodles',
         'Nouilles tofu-cacahuète',
         '🍜',
         20,
         'Dîner',
         'Une sauce cacahuète dosée pour apporter du goût et des lipides.',
         '#dfeee0',
         600,
         28,
         75,
         20,
         2.01,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu nature',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-peanut-noodles',
  ing.id,
  150,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.19
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-peanut-noodles',
  ing.id,
  75,
  'g',
  0.19
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-peanut-noodles',
  ing.id,
  12,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.04
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-peanut-noodles',
  ing.id,
  10,
  'ml',
  0.04
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.48
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tofu-peanut-noodles',
  ing.id,
  120,
  'g',
  0.48
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'stuffed-potato-tuna',
         'Pomme de terre farcie au thon',
         '🥔',
         30,
         'Dîner',
         'Un dîner économique qui utilise peu d’ingrédients.',
         '#f4dfdc',
         480,
         34,
         58,
         10,
         2.15,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'stuffed-potato-tuna',
  ing.id,
  300,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Thon au naturel égoutté',
    'Poisson',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'stuffed-potato-tuna',
  ing.id,
  100,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.21
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'stuffed-potato-tuna',
  ing.id,
  60,
  'g',
  0.21
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Maïs en conserve',
    'Épicerie',
    'g',
    0.14
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'stuffed-potato-tuna',
  ing.id,
  40,
  'g',
  0.14
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'lentil-shepherd-pie',
         'Parmentier de lentilles',
         '🥧',
         35,
         'Dîner',
         'Une version végétale du hachis, adaptée à la préparation en avance.',
         '#e9e4d7',
         520,
         23,
         82,
         10,
         1,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lentilles sèches',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-shepherd-pie',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pommes de terre',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-shepherd-pie',
  ing.id,
  250,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.16
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-shepherd-pie',
  ing.id,
  80,
  'g',
  0.16
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Oignon',
    'Fruits & légumes',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'lentil-shepherd-pie',
  ing.id,
  40,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'chicken-pesto-pasta',
         'Pâtes poulet-pesto',
         '🍝',
         20,
         'Dîner',
         'Un plat simple à ajuster en réduisant ou augmentant les pâtes.',
         '#dfead8',
         630,
         43,
         74,
         17,
         2.03,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pâtes complètes',
    'Épicerie',
    'g',
    0.21
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-pesto-pasta',
  ing.id,
  85,
  'g',
  0.21
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Poulet',
    'Viandes',
    'g',
    1.44
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-pesto-pasta',
  ing.id,
  120,
  'g',
  1.44
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pesto',
    'Épicerie',
    'g',
    0.14
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-pesto-pasta',
  ing.id,
  12,
  'g',
  0.14
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Épinards surgelés',
    'Fruits & légumes',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'chicken-pesto-pasta',
  ing.id,
  60,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'veggie-fried-rice',
         'Riz sauté au tofu et légumes',
         '🍚',
         18,
         'Dîner',
         'Une option végétale pour utiliser les restes de riz.',
         '#dfeee0',
         510,
         23,
         76,
         12,
         1.91,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Riz',
    'Épicerie',
    'g',
    0.19
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'veggie-fried-rice',
  ing.id,
  75,
  'g',
  0.19
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tofu nature',
    'Frais',
    'g',
    0.96
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'veggie-fried-rice',
  ing.id,
  120,
  'g',
  0.96
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Légumes surgelés',
    'Fruits & légumes',
    'g',
    0.72
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'veggie-fried-rice',
  ing.id,
  180,
  'g',
  0.72
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.04
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'veggie-fried-rice',
  ing.id,
  10,
  'ml',
  0.04
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'skyr-apple',
         'Skyr et pomme',
         '🍎',
         2,
         'Collation',
         'Collation riche en protéines avec un fruit.',
         '#e1eee7',
         210,
         22,
         27,
         1,
         1.37,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    1.02
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr-apple',
  ing.id,
  170,
  'g',
  1.02
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pomme',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'skyr-apple',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'cottage-crackers',
         'Cottage cheese et galettes de riz',
         '🍘',
         3,
         'Collation',
         'Une collation salée facile à emporter.',
         '#e1eee7',
         190,
         20,
         23,
         4,
         1.2,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cottage cheese',
    'Frais',
    'g',
    0.96
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-crackers',
  ing.id,
  120,
  'g',
  0.96
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Galettes de riz',
    'Épicerie',
    'pièce',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-crackers',
  ing.id,
  3,
  'pièce',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'banana-peanut-oats',
         'Banane, avoine et cacahuète',
         '🥜',
         3,
         'Collation',
         'Une collation énergétique pour les jours d’entraînement.',
         '#f2dfce',
         300,
         9,
         42,
         11,
         0.5,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-peanut-oats',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-peanut-oats',
  ing.id,
  25,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.08
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'banana-peanut-oats',
  ing.id,
  10,
  'g',
  0.08
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'yogurt-raisins',
         'Fromage blanc et raisins secs',
         '🥣',
         2,
         'Collation',
         'Une option économique à glucides rapides et protéines.',
         '#e9e4d7',
         200,
         18,
         28,
         2,
         0.82,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fromage blanc 0%',
    'Frais',
    'g',
    0.7
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'yogurt-raisins',
  ing.id,
  200,
  'g',
  0.7
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Raisins secs',
    'Fruits & légumes',
    'g',
    0.12
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'yogurt-raisins',
  ing.id,
  15,
  'g',
  0.12
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'egg-toast-snack',
         'Œuf dur et tartine',
         '🥚',
         10,
         'Collation',
         'Une collation salée riche en protéines.',
         '#f5e5cf',
         220,
         13,
         23,
         8,
         0.5,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Œufs',
    'Frais',
    'pièce',
    0.32
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-toast-snack',
  ing.id,
  1,
  'pièce',
  0.32
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.18
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'egg-toast-snack',
  ing.id,
  45,
  'g',
  0.18
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'hummus-carrot',
         'Houmous express et carottes',
         '🥕',
         5,
         'Collation',
         'Une collation végétale avec des légumes croquants.',
         '#dfeee0',
         180,
         7,
         25,
         6,
         0.57,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pois chiches en conserve',
    'Épicerie',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'hummus-carrot',
  ing.id,
  70,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Carottes',
    'Fruits & légumes',
    'g',
    0.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'hummus-carrot',
  ing.id,
  100,
  'g',
  0.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Citron',
    'Fruits & légumes',
    'pièce',
    0.09
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'hummus-carrot',
  ing.id,
  0.25,
  'pièce',
  0.09
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Huile d’olive',
    'Épicerie',
    'ml',
    0.04
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'hummus-carrot',
  ing.id,
  3,
  'ml',
  0.04
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'ricecake-peanut',
         'Galettes de riz au beurre de cacahuète',
         '🍘',
         2,
         'Collation',
         'Très rapide et pratique avant une séance.',
         '#f2dfce',
         220,
         7,
         28,
         10,
         0.34,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Galettes de riz',
    'Épicerie',
    'pièce',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'ricecake-peanut',
  ing.id,
  3,
  'pièce',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'ricecake-peanut',
  ing.id,
  12,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'milk-banana',
         'Lait et banane',
         '🥛',
         2,
         'Collation',
         'Une collation simple avec glucides et protéines.',
         '#f2dfce',
         210,
         9,
         38,
         4,
         0.73,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.38
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'milk-banana',
  ing.id,
  250,
  'ml',
  0.38
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Banane',
    'Fruits & légumes',
    'pièce',
    0.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'milk-banana',
  ing.id,
  1,
  'pièce',
  0.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'tuna-toast-snack',
         'Tartine au thon',
         '🥪',
         5,
         'Collation',
         'Une collation salée avec une bonne teneur en protéines.',
         '#f4dfdc',
         230,
         21,
         25,
         4,
         0.94,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain complet',
    'Boulangerie',
    'g',
    0.22
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-toast-snack',
  ing.id,
  55,
  'g',
  0.22
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Thon au naturel égoutté',
    'Poisson',
    'g',
    0.72
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'tuna-toast-snack',
  ing.id,
  60,
  'g',
  0.72
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'soy-yogurt-fruit',
         'Yaourt soja et fruits rouges',
         '🌱',
         2,
         'Collation',
         'Une option végétale et légère.',
         '#dfeee0',
         150,
         7,
         22,
         4,
         1.5,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Yaourt soja nature',
    'Frais',
    'g',
    0.6
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'soy-yogurt-fruit',
  ing.id,
  150,
  'g',
  0.6
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Fruits rouges surgelés',
    'Fruits & légumes',
    'g',
    0.9
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'soy-yogurt-fruit',
  ing.id,
  100,
  'g',
  0.9
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'cocoa-oat-bites',
         'Bouchées avoine-cacao',
         '🍫',
         10,
         'Collation',
         'Prépare plusieurs portions à l’avance pour la semaine.',
         '#eadfd4',
         240,
         7,
         35,
         8,
         0.38,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cocoa-oat-bites',
  ing.id,
  35,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Beurre de cacahuète',
    'Épicerie',
    'g',
    0.06
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cocoa-oat-bites',
  ing.id,
  8,
  'g',
  0.06
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cacao non sucré',
    'Épicerie',
    'g',
    0.07
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cocoa-oat-bites',
  ing.id,
  5,
  'g',
  0.07
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Dattes',
    'Fruits & légumes',
    'g',
    0.15
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cocoa-oat-bites',
  ing.id,
  15,
  'g',
  0.15
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'orange-skyr',
         'Skyr et orange',
         '🍊',
         2,
         'Collation',
         'Protéines et fruit, sans préparation.',
         '#f4dfdc',
         190,
         19,
         25,
         1,
         1.3,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Skyr',
    'Frais',
    'g',
    0.9
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'orange-skyr',
  ing.id,
  150,
  'g',
  0.9
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Orange',
    'Fruits & légumes',
    'pièce',
    0.4
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'orange-skyr',
  ing.id,
  1,
  'pièce',
  0.4
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'cottage-tomato',
         'Cottage cheese et tomates',
         '🍅',
         3,
         'Collation',
         'Une collation fraîche, riche en protéines et pauvre en sucre ajouté.',
         '#e1eee7',
         160,
         19,
         10,
         5,
         1.7,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Cottage cheese',
    'Frais',
    'g',
    1.2
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-tomato',
  ing.id,
  150,
  'g',
  1.2
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Tomates',
    'Fruits & légumes',
    'g',
    0.5
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'cottage-tomato',
  ing.id,
  100,
  'g',
  0.5
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'edamame-snack',
         'Edamame vapeur',
         '🌱',
         8,
         'Collation',
         'Une collation végétale riche en protéines et fibres.',
         '#dfeee0',
         190,
         18,
         15,
         7,
         1.37,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Edamame surgelés',
    'Fruits & légumes',
    'g',
    1.35
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'edamame-snack',
  ing.id,
  150,
  'g',
  1.35
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Sauce soja',
    'Épicerie',
    'ml',
    0.02
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'edamame-snack',
  ing.id,
  5,
  'ml',
  0.02
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'pita-yogurt',
         'Mini pita et sauce yaourt',
         '🥙',
         4,
         'Collation',
         'Une collation salée à personnaliser avec les herbes disponibles.',
         '#e1eee7',
         210,
         10,
         35,
         4,
         0.62,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Pain pita',
    'Boulangerie',
    'pièce',
    0.23
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pita-yogurt',
  ing.id,
  0.5,
  'pièce',
  0.23
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Yaourt nature',
    'Frais',
    'g',
    0.24
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pita-yogurt',
  ing.id,
  80,
  'g',
  0.24
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Concombre',
    'Fruits & légumes',
    'g',
    0.15
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'pita-yogurt',
  ing.id,
  50,
  'g',
  0.15
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         'protein-oats',
         'Crème avoine protéinée',
         '🥣',
         6,
         'Collation',
         'Option facultative avec whey, remplaçable par du skyr.',
         '#e9e4d7',
         280,
         25,
         37,
         5,
         0.86,
         TRUE
       )
       ON CONFLICT (id) DO UPDATE SET
         name = EXCLUDED.name,
         emoji = EXCLUDED.emoji,
         prep_minutes = EXCLUDED.prep_minutes,
         category = EXCLUDED.category,
         description = EXCLUDED.description,
         color = EXCLUDED.color,
         calories = EXCLUDED.calories,
         protein_g = EXCLUDED.protein_g,
         carbs_g = EXCLUDED.carbs_g,
         fat_g = EXCLUDED.fat_g,
         estimated_cost = EXCLUDED.estimated_cost,
         active = TRUE;

WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Flocons d’avoine',
    'Épicerie',
    'g',
    0.1
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'protein-oats',
  ing.id,
  35,
  'g',
  0.1
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Lait',
    'Frais',
    'ml',
    0.23
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'protein-oats',
  ing.id,
  150,
  'ml',
  0.23
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;


WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    'Whey protéine (facultatif)',
    'Épicerie',
    'g',
    0.53
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  'protein-oats',
  ing.id,
  15,
  'g',
  0.53
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;

COMMIT;
