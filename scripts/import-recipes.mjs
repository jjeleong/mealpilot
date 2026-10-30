import fs from "node:fs/promises";
import path from "node:path";
import { pathToFileURL } from "node:url";

const root = process.cwd();
const sourcePath = path.join(root, "src", "data", "recipes.ts");
const generatedPath = path.join(root, "src", "data", "recipes.generated.mjs");
const outputPath = path.join(root, "recipes-seed.sql");

function sqlString(value) {
  if (value === null || value === undefined || value === "") {
    return "NULL";
  }
  return "'" + String(value).replace(/'/g, "''") + "'";
}

function sqlNumber(value, fallback = 0) {
  const number = Number(value ?? fallback);
  if (!Number.isFinite(number)) {
    throw new Error(`Valeur numérique invalide : ${value}`);
  }
  return String(number);
}

try {
  let source = await fs.readFile(sourcePath, "utf8");

  // Retire les imports TypeScript et convertit la déclaration en JavaScript.
  source = source.replace(/^\s*import\s+type\s+.*?;\s*$/gm, "");
  source = source.replace(
    /export\s+const\s+RECIPES\s*:\s*Recipe\[\]\s*=/,
    "export const RECIPES ="
  );

  if (!source.includes("export const RECIPES =")) {
    throw new Error(
      "Déclaration RECIPES introuvable. Vérifie le début de recipes.ts."
    );
  }

  await fs.writeFile(generatedPath, source, "utf8");

  const moduleUrl =
    pathToFileURL(generatedPath).href + `?v=${Date.now()}`;
  const { RECIPES } = await import(moduleUrl);

  if (!Array.isArray(RECIPES) || RECIPES.length === 0) {
    throw new Error("Aucune recette trouvée dans RECIPES.");
  }

  const sql = ["BEGIN;", ""];

  for (const recipe of RECIPES) {
    if (!recipe.id || !recipe.name) {
      throw new Error("Une recette ne possède pas d'id ou de nom.");
    }

    sql.push(
      `INSERT INTO recipe
        (id, name, emoji, prep_minutes, category, description, color,
         calories, protein_g, carbs_g, fat_g, estimated_cost, active)
       VALUES (
         ${sqlString(recipe.id)},
         ${sqlString(recipe.name)},
         ${sqlString(recipe.emoji)},
         ${sqlNumber(recipe.time)},
         ${sqlString(recipe.category)},
         ${sqlString(recipe.description)},
         ${sqlString(recipe.color)},
         ${sqlNumber(recipe.kcal)},
         ${sqlNumber(recipe.protein)},
         ${sqlNumber(recipe.carbs)},
         ${sqlNumber(recipe.fat)},
         ${sqlNumber(recipe.cost)},
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
         active = TRUE;`
    );

    for (const ingredient of recipe.ingredients ?? []) {
      if (!ingredient.name) {
        throw new Error(`Ingrédient sans nom dans ${recipe.id}`);
      }

      const unit = ingredient.unit || "g";
      const category = ingredient.category || "Épicerie";

      sql.push(`
WITH ing AS (
  INSERT INTO ingredient (name, category, base_unit, estimated_cost)
  VALUES (
    ${sqlString(ingredient.name)},
    ${sqlString(category)},
    ${sqlString(unit)},
    ${sqlNumber(ingredient.estimatedCost)}
  )
  ON CONFLICT (name) DO UPDATE SET
    category = EXCLUDED.category,
    base_unit = EXCLUDED.base_unit,
    estimated_cost = EXCLUDED.estimated_cost
  RETURNING id
)
INSERT INTO recipe_ingredient
  (recipe_id, ingredient_id, quantity, unit, estimated_cost)
SELECT
  ${sqlString(recipe.id)},
  ing.id,
  ${sqlNumber(ingredient.quantity)},
  ${sqlString(unit)},
  ${sqlNumber(ingredient.estimatedCost)}
FROM ing
ON CONFLICT (recipe_id, ingredient_id, unit)
DO UPDATE SET
  quantity = EXCLUDED.quantity,
  estimated_cost = EXCLUDED.estimated_cost;
`);
    }
  }

  sql.push("COMMIT;", "");

  await fs.writeFile(outputPath, sql.join("\n"), "utf8");

  console.log(`Recettes trouvées : ${RECIPES.length}`);
  console.log(`Fichier SQL généré : ${outputPath}`);
  console.log("Aucune donnée PostgreSQL n'a encore été modifiée.");
} finally {
  await fs.rm(generatedPath, { force: true });
}