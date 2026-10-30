import type { Ingredient, Recipe, ShoppingItem, WeeklyPlan } from "../types";

export function buildShoppingList(plan: WeeklyPlan, recipes: Recipe[]): ShoppingItem[] {
  const aggregated = new Map<string, ShoppingItem>();
  Object.values(plan).forEach(day => {
    Object.values(day).forEach(recipeId => {
      const recipe = recipes.find(item => item.id === recipeId);
      if (!recipe) return;
      recipe.ingredients.forEach((ingredient: Ingredient) => {
        const key = ingredient.name.toLocaleLowerCase("fr");
        const current = aggregated.get(key);
        if (!current) aggregated.set(key, { name: ingredient.name, category: ingredient.category, quantity: ingredient.quantity, unit: ingredient.unit, estimatedCost: ingredient.estimatedCost });
        else if (current.unit === ingredient.unit) { current.quantity += ingredient.quantity; current.estimatedCost += ingredient.estimatedCost; }
      });
    });
  });
  return [...aggregated.values()].sort((a,b) => a.category.localeCompare(b.category,"fr") || a.name.localeCompare(b.name,"fr"));
}
export function formatQuantity(quantity: number): string { return Number.isInteger(quantity) ? String(quantity) : String(Math.round(quantity * 10) / 10).replace(".", ","); }
