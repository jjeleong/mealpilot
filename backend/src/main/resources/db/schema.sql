CREATE TABLE IF NOT EXISTS app_user (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(100) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS athlete_profile (
  user_id BIGINT PRIMARY KEY REFERENCES app_user(id) ON DELETE CASCADE,
  age INTEGER CHECK (age IS NULL OR age BETWEEN 13 AND 100),
  sex VARCHAR(12) NOT NULL DEFAULT 'homme' CHECK (sex IN ('homme','femme')),
  height_cm NUMERIC(5,2), weight_kg NUMERIC(5,2), activity NUMERIC(3,2) NOT NULL DEFAULT 1.55,
  goal VARCHAR(12) NOT NULL DEFAULT 'maintain' CHECK (goal IN ('bulk','cut','maintain')),
  diet VARCHAR(20) NOT NULL DEFAULT 'omnivore' CHECK (diet IN ('omnivore','vegetarien','vegan')),
  weekly_budget NUMERIC(10,2) NOT NULL DEFAULT 65 CHECK (weekly_budget >= 0),
  portions INTEGER NOT NULL DEFAULT 1 CHECK (portions > 0), avoid_ingredients TEXT NOT NULL DEFAULT ''
);
CREATE TABLE IF NOT EXISTS recipe (
  id VARCHAR(100) PRIMARY KEY, name VARCHAR(200) NOT NULL, emoji VARCHAR(20), prep_minutes INTEGER NOT NULL DEFAULT 0,
  category VARCHAR(60) NOT NULL, description TEXT, color VARCHAR(20), calories NUMERIC(8,2) NOT NULL DEFAULT 0,
  protein_g NUMERIC(8,2) NOT NULL DEFAULT 0, carbs_g NUMERIC(8,2) NOT NULL DEFAULT 0, fat_g NUMERIC(8,2) NOT NULL DEFAULT 0,
  estimated_cost NUMERIC(10,2) NOT NULL DEFAULT 0, active BOOLEAN NOT NULL DEFAULT TRUE
);
CREATE TABLE IF NOT EXISTS ingredient (
  id BIGSERIAL PRIMARY KEY, name VARCHAR(200) NOT NULL UNIQUE, category VARCHAR(60) NOT NULL DEFAULT 'Épicerie',
  base_unit VARCHAR(20) NOT NULL DEFAULT 'g', estimated_cost NUMERIC(10,4) NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS recipe_ingredient (
  recipe_id VARCHAR(100) NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
  ingredient_id BIGINT NOT NULL REFERENCES ingredient(id), quantity NUMERIC(12,3) NOT NULL CHECK(quantity > 0),
  unit VARCHAR(20) NOT NULL, estimated_cost NUMERIC(10,4) NOT NULL DEFAULT 0,
  PRIMARY KEY(recipe_id, ingredient_id, unit)
);
CREATE TABLE IF NOT EXISTS favorite (
  user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  recipe_id VARCHAR(100) NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), PRIMARY KEY(user_id, recipe_id)
);
CREATE TABLE IF NOT EXISTS weekly_plan (
  id BIGSERIAL PRIMARY KEY, user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  week_start DATE NOT NULL, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), UNIQUE(user_id, week_start)
);
CREATE TABLE IF NOT EXISTS planned_meal (
  id BIGSERIAL PRIMARY KEY, plan_id BIGINT NOT NULL REFERENCES weekly_plan(id) ON DELETE CASCADE,
  day_of_week SMALLINT NOT NULL CHECK(day_of_week BETWEEN 0 AND 6), meal_type VARCHAR(20) NOT NULL CHECK(meal_type IN ('breakfast','lunch','dinner','snack')),
  recipe_id VARCHAR(100) REFERENCES recipe(id) ON DELETE SET NULL, servings NUMERIC(5,2) NOT NULL DEFAULT 1,
  UNIQUE(plan_id, day_of_week, meal_type)
);
CREATE TABLE IF NOT EXISTS food_log (
  id BIGSERIAL PRIMARY KEY, user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  consumed_on DATE NOT NULL DEFAULT CURRENT_DATE, recipe_id VARCHAR(100) REFERENCES recipe(id) ON DELETE SET NULL,
  meal_type VARCHAR(20), servings NUMERIC(5,2) NOT NULL DEFAULT 1,
  calories NUMERIC(8,2) NOT NULL DEFAULT 0, protein_g NUMERIC(8,2) NOT NULL DEFAULT 0,
  carbs_g NUMERIC(8,2) NOT NULL DEFAULT 0, fat_g NUMERIC(8,2) NOT NULL DEFAULT 0, note TEXT
);
CREATE TABLE IF NOT EXISTS shopping_list (
  id BIGSERIAL PRIMARY KEY, user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  plan_id BIGINT REFERENCES weekly_plan(id) ON DELETE CASCADE, name VARCHAR(150) NOT NULL DEFAULT 'Courses de la semaine',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS shopping_item (
  id BIGSERIAL PRIMARY KEY, shopping_list_id BIGINT NOT NULL REFERENCES shopping_list(id) ON DELETE CASCADE,
  ingredient_id BIGINT REFERENCES ingredient(id) ON DELETE SET NULL, name VARCHAR(200) NOT NULL,
  quantity NUMERIC(12,3) NOT NULL DEFAULT 0, unit VARCHAR(20) NOT NULL DEFAULT 'g', estimated_cost NUMERIC(10,2) NOT NULL DEFAULT 0,
  checked BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE INDEX IF NOT EXISTS idx_recipe_category ON recipe(category);
CREATE INDEX IF NOT EXISTS idx_food_log_user_date ON food_log(user_id, consumed_on);
CREATE INDEX IF NOT EXISTS idx_plan_user_week ON weekly_plan(user_id, week_start);
