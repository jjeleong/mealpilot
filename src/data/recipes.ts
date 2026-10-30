import type { Recipe } from "../types";

// Coûts indicatifs par portion, calculés depuis les coûts estimés des ingrédients.
export const RECIPES: Recipe[] = [
  {
    "id": "overnight",
    "name": "Overnight oats protéinés",
    "emoji": "🥣",
    "time": 5,
    "category": "Petit-déjeuner",
    "description": "La veille au soir, prépare un petit-déjeuner crémeux et pratique.",
    "color": "#e9e4d7",
    "kcal": 450,
    "protein": 32,
    "carbs": 58,
    "fat": 11,
    "cost": 2.15,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 200,
        "unit": "ml",
        "estimatedCost": 0.3
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.12
      }
    ]
  },
  {
    "id": "omelette",
    "name": "Omelette complète & tartines",
    "emoji": "🍳",
    "time": 15,
    "category": "Petit-déjeuner",
    "description": "Un classique riche en protéines, avec des glucides pour démarrer.",
    "color": "#f5e5cf",
    "kcal": 510,
    "protein": 34,
    "carbs": 43,
    "fat": 22,
    "cost": 1.62,
    "ingredients": [
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièces",
        "estimatedCost": 0.64
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.32
      },
      {
        "name": "Épinards",
        "category": "Fruits & légumes",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.42
      },
      {
        "name": "Emmental",
        "category": "Frais",
        "quantity": 20,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "pancakes",
    "name": "Pancakes banane-protéines",
    "emoji": "🥞",
    "time": 18,
    "category": "Petit-déjeuner",
    "description": "Des pancakes moelleux pour les matins où tu as besoin d’énergie.",
    "color": "#f2dfce",
    "kcal": 520,
    "protein": 35,
    "carbs": 67,
    "fat": 12,
    "cost": 2.37,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièces",
        "estimatedCost": 0.64
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 1.2
      }
    ]
  },
  {
    "id": "chicken-rice",
    "name": "Poulet, riz & légumes",
    "emoji": "🍗",
    "time": 25,
    "category": "Déjeuner",
    "description": "Un plat simple à préparer en avance, équilibré et facile à portionner.",
    "color": "#dfead8",
    "kcal": 620,
    "protein": 48,
    "carbs": 76,
    "fat": 12,
    "cost": 2.86,
    "ingredients": [
      {
        "name": "Poulet",
        "category": "Viandes",
        "quantity": 160,
        "unit": "g",
        "estimatedCost": 1.92
      },
      {
        "name": "Riz basmati",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Brocoli",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.6
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 8,
        "unit": "ml",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "salmon",
    "name": "Saumon, pommes de terre & haricots",
    "emoji": "🐟",
    "time": 30,
    "category": "Déjeuner",
    "description": "Des protéines, des glucides et des bons lipides dans une assiette complète.",
    "color": "#f4dfdc",
    "kcal": 670,
    "protein": 42,
    "carbs": 62,
    "fat": 25,
    "cost": 5.62,
    "ingredients": [
      {
        "name": "Saumon",
        "category": "Poisson",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 4.2
      },
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Haricots verts",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.75
      },
      {
        "name": "Citron",
        "category": "Fruits & légumes",
        "quantity": 0.5,
        "unit": "pièce",
        "estimatedCost": 0.17
      }
    ]
  },
  {
    "id": "bowl",
    "name": "Bowl bœuf, quinoa & avocat",
    "emoji": "🥑",
    "time": 25,
    "category": "Déjeuner",
    "description": "Un bowl nourrissant avec une bonne variété de textures.",
    "color": "#dfeee0",
    "kcal": 690,
    "protein": 43,
    "carbs": 70,
    "fat": 24,
    "cost": 4.38,
    "ingredients": [
      {
        "name": "Bœuf haché 5%",
        "category": "Viandes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 2.4
      },
      {
        "name": "Quinoa",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.63
      },
      {
        "name": "Avocat",
        "category": "Fruits & légumes",
        "quantity": 0.5,
        "unit": "pièce",
        "estimatedCost": 0.6
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.75
      }
    ]
  },
  {
    "id": "lentils",
    "name": "Dahl de lentilles & riz",
    "emoji": "🍛",
    "time": 30,
    "category": "Déjeuner",
    "description": "Une option végétarienne économique, rassasiante et riche en fibres.",
    "color": "#f6e5c9",
    "kcal": 590,
    "protein": 25,
    "carbs": 88,
    "fat": 12,
    "cost": 1.38,
    "ingredients": [
      {
        "name": "Lentilles corail",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.32
      },
      {
        "name": "Riz basmati",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Lait de coco léger",
        "category": "Épicerie",
        "quantity": 100,
        "unit": "ml",
        "estimatedCost": 0.4
      },
      {
        "name": "Épinards",
        "category": "Fruits & légumes",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.42
      }
    ]
  },
  {
    "id": "wrap",
    "name": "Wrap poulet & crudités",
    "emoji": "🌯",
    "time": 15,
    "category": "Déjeuner",
    "description": "Facile à emporter, avec une sauce au yaourt légère.",
    "color": "#f4e8d2",
    "kcal": 540,
    "protein": 42,
    "carbs": 58,
    "fat": 14,
    "cost": 4.29,
    "ingredients": [
      {
        "name": "Tortillas complètes",
        "category": "Épicerie",
        "quantity": 2,
        "unit": "pièces",
        "estimatedCost": 0.9
      },
      {
        "name": "Poulet",
        "category": "Viandes",
        "quantity": 160,
        "unit": "g",
        "estimatedCost": 1.92
      },
      {
        "name": "Yaourt grec",
        "category": "Frais",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.48
      },
      {
        "name": "Salade",
        "category": "Fruits & légumes",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.75
      }
    ]
  },
  {
    "id": "pasta",
    "name": "Pâtes au thon et tomate",
    "emoji": "🍝",
    "time": 20,
    "category": "Dîner",
    "description": "Un dîner rapide avec des ingrédients faciles à garder au placard.",
    "color": "#f7e4d6",
    "kcal": 610,
    "protein": 39,
    "carbs": 78,
    "fat": 13,
    "cost": 1.98,
    "ingredients": [
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 90,
        "unit": "g",
        "estimatedCost": 0.23
      },
      {
        "name": "Thon au naturel",
        "category": "Poisson",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Tomates concassées",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Parmesan",
        "category": "Frais",
        "quantity": 10,
        "unit": "g",
        "estimatedCost": 0.25
      }
    ]
  },
  {
    "id": "chili",
    "name": "Chili de dinde & haricots rouges",
    "emoji": "🌶️",
    "time": 30,
    "category": "Dîner",
    "description": "Un plat mijoté qui se conserve bien pour le batch cooking.",
    "color": "#f2dfd7",
    "kcal": 570,
    "protein": 46,
    "carbs": 62,
    "fat": 13,
    "cost": 2.61,
    "ingredients": [
      {
        "name": "Dinde hachée",
        "category": "Viandes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.8
      },
      {
        "name": "Haricots rouges",
        "category": "Épicerie",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Tomates concassées",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.21
      }
    ]
  },
  {
    "id": "tofu",
    "name": "Tofu croustillant & nouilles",
    "emoji": "🥢",
    "time": 25,
    "category": "Dîner",
    "description": "Une alternative végétale avec une sauce soja-gingembre.",
    "color": "#e5e9d8",
    "kcal": 590,
    "protein": 31,
    "carbs": 74,
    "fat": 18,
    "cost": 1.88,
    "ingredients": [
      {
        "name": "Tofu ferme",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.35
      },
      {
        "name": "Nouilles de blé",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 15,
        "unit": "ml",
        "estimatedCost": 0.09
      }
    ]
  },
  {
    "id": "omelet-dinner",
    "name": "Frittata pommes de terre & épinards",
    "emoji": "🍽️",
    "time": 25,
    "category": "Dîner",
    "description": "Un repas économique qui utilise les ingrédients du quotidien.",
    "color": "#f3e8d0",
    "kcal": 480,
    "protein": 29,
    "carbs": 42,
    "fat": 21,
    "cost": 1.92,
    "ingredients": [
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièces",
        "estimatedCost": 0.64
      },
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Épinards",
        "category": "Fruits & légumes",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.42
      },
      {
        "name": "Feta",
        "category": "Frais",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.36
      }
    ]
  },
  {
    "id": "skyr",
    "name": "Skyr, fruits rouges & granola",
    "emoji": "🍓",
    "time": 5,
    "category": "Collation",
    "description": "Une collation rapide à ajuster selon tes besoins énergétiques.",
    "color": "#f5e3eb",
    "kcal": 280,
    "protein": 25,
    "carbs": 31,
    "fat": 6,
    "cost": 2.67,
    "ingredients": [
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Fruits rouges",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Granola",
        "category": "Épicerie",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.27
      }
    ]
  },
  {
    "id": "shake",
    "name": "Smoothie banane-cacao",
    "emoji": "🥤",
    "time": 5,
    "category": "Collation",
    "description": "Une boisson pratique après une séance ou en complément du goûter.",
    "color": "#e7e1f2",
    "kcal": 330,
    "protein": 24,
    "carbs": 45,
    "fat": 7,
    "cost": 0.87,
    "ingredients": [
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 200,
        "unit": "ml",
        "estimatedCost": 0.3
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Cacao non sucré",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.12
      }
    ]
  },
  {
    "id": "cottage",
    "name": "Tartines cottage cheese",
    "emoji": "🥪",
    "time": 8,
    "category": "Collation",
    "description": "Une option salée riche en protéines, sans préparation compliquée.",
    "color": "#e1eee7",
    "kcal": 300,
    "protein": 26,
    "carbs": 34,
    "fat": 7,
    "cost": 1.76,
    "ingredients": [
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.32
      },
      {
        "name": "Cottage cheese",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Concombre",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "energy",
    "name": "Boulettes avoine-dattes",
    "emoji": "🍫",
    "time": 12,
    "category": "Collation",
    "description": "Petites bouchées énergétiques à préparer pour plusieurs jours.",
    "color": "#eadfd4",
    "kcal": 240,
    "protein": 8,
    "carbs": 35,
    "fat": 8,
    "cost": 0.7,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Dattes",
        "category": "Fruits & légumes",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Cacao non sucré",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "porridge-apple",
    "name": "Porridge pomme-cannelle",
    "emoji": "🥣",
    "time": 8,
    "category": "Petit-déjeuner",
    "description": "Un petit-déjeuner chaud avec des ingrédients de placard.",
    "color": "#e9e4d7",
    "kcal": 390,
    "protein": 20,
    "carbs": 62,
    "fat": 8,
    "cost": 1.11,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 200,
        "unit": "ml",
        "estimatedCost": 0.3
      },
      {
        "name": "Pomme",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.28
      }
    ]
  },
  {
    "id": "skyr-bowl",
    "name": "Bol skyr, avoine et fruits rouges",
    "emoji": "🫐",
    "time": 5,
    "category": "Petit-déjeuner",
    "description": "Très riche en protéines, prêt en quelques minutes.",
    "color": "#e1eee7",
    "kcal": 360,
    "protein": 30,
    "carbs": 48,
    "fat": 6,
    "cost": 2.27,
    "ingredients": [
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Fruits rouges surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.9
      },
      {
        "name": "Miel",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "g",
        "estimatedCost": 0.05
      }
    ]
  },
  {
    "id": "egg-toast",
    "name": "Œufs brouillés sur pain complet",
    "emoji": "🍳",
    "time": 10,
    "category": "Petit-déjeuner",
    "description": "Simple, rassasiant et économique.",
    "color": "#f5e5cf",
    "kcal": 410,
    "protein": 25,
    "carbs": 37,
    "fat": 17,
    "cost": 1.2,
    "ingredients": [
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 90,
        "unit": "g",
        "estimatedCost": 0.36
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.2
      }
    ]
  },
  {
    "id": "banana-oat-pancake",
    "name": "Pancakes avoine-banane économiques",
    "emoji": "🥞",
    "time": 15,
    "category": "Petit-déjeuner",
    "description": "Une recette sans whey, idéale avant l’entraînement.",
    "color": "#f2dfce",
    "kcal": 430,
    "protein": 20,
    "carbs": 67,
    "fat": 10,
    "cost": 0.92,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.32
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 50,
        "unit": "ml",
        "estimatedCost": 0.07
      }
    ]
  },
  {
    "id": "cottage-toast",
    "name": "Tartines cottage cheese et tomate",
    "emoji": "🥪",
    "time": 7,
    "category": "Petit-déjeuner",
    "description": "Une option salée avec des protéines et des légumes.",
    "color": "#e1eee7",
    "kcal": 330,
    "protein": 25,
    "carbs": 39,
    "fat": 8,
    "cost": 1.52,
    "ingredients": [
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.32
      },
      {
        "name": "Cottage cheese",
        "category": "Frais",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.8
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.4
      }
    ]
  },
  {
    "id": "overnight-cacao",
    "name": "Overnight oats cacao-banane",
    "emoji": "🍫",
    "time": 5,
    "category": "Petit-déjeuner",
    "description": "À préparer la veille pour gagner du temps le matin.",
    "color": "#eadfd4",
    "kcal": 440,
    "protein": 25,
    "carbs": 65,
    "fat": 10,
    "cost": 1.22,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 180,
        "unit": "ml",
        "estimatedCost": 0.27
      },
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.35
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Cacao non sucré",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "g",
        "estimatedCost": 0.07
      }
    ]
  },
  {
    "id": "fromage-blanc-muesli",
    "name": "Fromage blanc, muesli et pomme",
    "emoji": "🍎",
    "time": 4,
    "category": "Petit-déjeuner",
    "description": "Un bol rapide qui utilise des ingrédients faciles à trouver.",
    "color": "#e9e4d7",
    "kcal": 370,
    "protein": 24,
    "carbs": 54,
    "fat": 7,
    "cost": 1.41,
    "ingredients": [
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.88
      },
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 35,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Pomme",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Raisins secs",
        "category": "Fruits & légumes",
        "quantity": 10,
        "unit": "g",
        "estimatedCost": 0.08
      }
    ]
  },
  {
    "id": "omelette-champignons",
    "name": "Omelette aux champignons et tartine",
    "emoji": "🍄",
    "time": 12,
    "category": "Petit-déjeuner",
    "description": "Petit-déjeuner salé avec des légumes et du pain complet.",
    "color": "#f5e5cf",
    "kcal": 390,
    "protein": 25,
    "carbs": 32,
    "fat": 16,
    "cost": 1.6,
    "ingredients": [
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Champignons",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.6
      },
      {
        "name": "Emmental râpé",
        "category": "Frais",
        "quantity": 10,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "yogurt-peanut-banana",
    "name": "Bol yaourt, banane et cacahuète",
    "emoji": "🥜",
    "time": 4,
    "category": "Petit-déjeuner",
    "description": "Une option énergétique à petit prix.",
    "color": "#f4dfdc",
    "kcal": 400,
    "protein": 22,
    "carbs": 51,
    "fat": 13,
    "cost": 1.22,
    "ingredients": [
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 0.7
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 12,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 25,
        "unit": "g",
        "estimatedCost": 0.07
      }
    ]
  },
  {
    "id": "french-toast",
    "name": "Pain perdu protéiné",
    "emoji": "🍞",
    "time": 12,
    "category": "Petit-déjeuner",
    "description": "Utilise du pain de la veille pour limiter le gaspillage.",
    "color": "#f2dfce",
    "kcal": 420,
    "protein": 25,
    "carbs": 54,
    "fat": 11,
    "cost": 1.43,
    "ingredients": [
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 90,
        "unit": "g",
        "estimatedCost": 0.36
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.32
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 100,
        "unit": "ml",
        "estimatedCost": 0.15
      },
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.6
      }
    ]
  },
  {
    "id": "pita-egg",
    "name": "Pita aux œufs et épinards",
    "emoji": "🥙",
    "time": 12,
    "category": "Petit-déjeuner",
    "description": "Un sandwich chaud pratique à emporter.",
    "color": "#dfead8",
    "kcal": 390,
    "protein": 23,
    "carbs": 43,
    "fat": 13,
    "cost": 1.33,
    "ingredients": [
      {
        "name": "Pain pita",
        "category": "Boulangerie",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.45
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "semolina-milk",
    "name": "Semoule au lait et raisins",
    "emoji": "🥣",
    "time": 10,
    "category": "Petit-déjeuner",
    "description": "Une recette douce et économique pour augmenter les glucides.",
    "color": "#e9e4d7",
    "kcal": 360,
    "protein": 17,
    "carbs": 63,
    "fat": 5,
    "cost": 0.9,
    "ingredients": [
      {
        "name": "Semoule complète",
        "category": "Épicerie",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 250,
        "unit": "ml",
        "estimatedCost": 0.38
      },
      {
        "name": "Raisins secs",
        "category": "Fruits & légumes",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.28
      }
    ]
  },
  {
    "id": "tofu-scramble",
    "name": "Tofu brouillé et tartines",
    "emoji": "🌱",
    "time": 12,
    "category": "Petit-déjeuner",
    "description": "Petit-déjeuner végétal avec une bonne part de protéines.",
    "color": "#dfeee0",
    "kcal": 390,
    "protein": 25,
    "carbs": 38,
    "fat": 15,
    "cost": 1.48,
    "ingredients": [
      {
        "name": "Tofu nature",
        "category": "Frais",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.96
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.32
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.2
      }
    ]
  },
  {
    "id": "ricecakes-cottage",
    "name": "Galettes de riz au cottage cheese",
    "emoji": "🍘",
    "time": 5,
    "category": "Petit-déjeuner",
    "description": "Léger et rapide quand le temps manque.",
    "color": "#e1eee7",
    "kcal": 290,
    "protein": 23,
    "carbs": 34,
    "fat": 6,
    "cost": 1.92,
    "ingredients": [
      {
        "name": "Galettes de riz",
        "category": "Épicerie",
        "quantity": 4,
        "unit": "pièce",
        "estimatedCost": 0.32
      },
      {
        "name": "Cottage cheese",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.4
      }
    ]
  },
  {
    "id": "pear-oat-bowl",
    "name": "Porridge poire et yaourt",
    "emoji": "🍐",
    "time": 8,
    "category": "Petit-déjeuner",
    "description": "Une alternative simple au porridge classique.",
    "color": "#f2dfce",
    "kcal": 380,
    "protein": 21,
    "carbs": 60,
    "fat": 7,
    "cost": 1.12,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 55,
        "unit": "g",
        "estimatedCost": 0.17
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 180,
        "unit": "ml",
        "estimatedCost": 0.27
      },
      {
        "name": "Poire",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.4
      },
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.28
      }
    ]
  },
  {
    "id": "savory-oats",
    "name": "Porridge salé aux œufs",
    "emoji": "🍳",
    "time": 10,
    "category": "Petit-déjeuner",
    "description": "Avoine, œufs et épinards pour changer des petits-déjeuners sucrés.",
    "color": "#dfead8",
    "kcal": 370,
    "protein": 23,
    "carbs": 42,
    "fat": 12,
    "cost": 1.03,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.15
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "lentil-rice",
    "name": "Dahl de lentilles et riz",
    "emoji": "🍛",
    "time": 25,
    "category": "Déjeuner",
    "description": "Une base végétarienne très économique, riche en fibres.",
    "color": "#dfeee0",
    "kcal": 560,
    "protein": 25,
    "carbs": 91,
    "fat": 8,
    "cost": 0.8,
    "ingredients": [
      {
        "name": "Lentilles sèches",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "ml",
        "estimatedCost": 0.06
      }
    ]
  },
  {
    "id": "tuna-pasta",
    "name": "Pâtes au thon et tomate",
    "emoji": "🍝",
    "time": 18,
    "category": "Déjeuner",
    "description": "Un repas riche en protéines avec des ingrédients de placard.",
    "color": "#f4dfdc",
    "kcal": 560,
    "protein": 38,
    "carbs": 76,
    "fat": 10,
    "cost": 1.74,
    "ingredients": [
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 90,
        "unit": "g",
        "estimatedCost": 0.23
      },
      {
        "name": "Thon au naturel égoutté",
        "category": "Poisson",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.07
      }
    ]
  },
  {
    "id": "chili-beans-rice",
    "name": "Chili sin carne et riz",
    "emoji": "🌶️",
    "time": 22,
    "category": "Déjeuner",
    "description": "Un plat végétal facile à cuisiner en plusieurs portions.",
    "color": "#f2dfce",
    "kcal": 590,
    "protein": 22,
    "carbs": 98,
    "fat": 9,
    "cost": 1.29,
    "ingredients": [
      {
        "name": "Haricots rouges en conserve",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.53
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Maïs en conserve",
        "category": "Épicerie",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "turkey-pasta",
    "name": "Pâtes à la dinde et tomate",
    "emoji": "🍝",
    "time": 20,
    "category": "Déjeuner",
    "description": "Une alternative à petit prix aux plats de viande plus chers.",
    "color": "#dfead8",
    "kcal": 610,
    "protein": 43,
    "carbs": 78,
    "fat": 12,
    "cost": 2.49,
    "ingredients": [
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 90,
        "unit": "g",
        "estimatedCost": 0.23
      },
      {
        "name": "Dinde",
        "category": "Viandes",
        "quantity": 130,
        "unit": "g",
        "estimatedCost": 1.82
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.2
      }
    ]
  },
  {
    "id": "tofu-rice-bowl",
    "name": "Bowl tofu, riz et légumes",
    "emoji": "🥗",
    "time": 20,
    "category": "Déjeuner",
    "description": "Une assiette végétale complète, adaptable avec les légumes surgelés.",
    "color": "#dfeee0",
    "kcal": 550,
    "protein": 25,
    "carbs": 75,
    "fat": 15,
    "cost": 2.15,
    "ingredients": [
      {
        "name": "Tofu nature",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 75,
        "unit": "g",
        "estimatedCost": 0.19
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 180,
        "unit": "g",
        "estimatedCost": 0.72
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 10,
        "unit": "ml",
        "estimatedCost": 0.04
      }
    ]
  },
  {
    "id": "chickpea-couscous",
    "name": "Couscous pois chiches et légumes",
    "emoji": "🥘",
    "time": 20,
    "category": "Déjeuner",
    "description": "Très économique et facile à préparer en grande quantité.",
    "color": "#e9e4d7",
    "kcal": 570,
    "protein": 22,
    "carbs": 94,
    "fat": 10,
    "cost": 1.08,
    "ingredients": [
      {
        "name": "Semoule complète",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Pois chiches en conserve",
        "category": "Épicerie",
        "quantity": 130,
        "unit": "g",
        "estimatedCost": 0.46
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.16
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "ml",
        "estimatedCost": 0.06
      }
    ]
  },
  {
    "id": "egg-fried-rice",
    "name": "Riz sauté aux œufs et légumes",
    "emoji": "🍚",
    "time": 15,
    "category": "Déjeuner",
    "description": "Parfait pour utiliser du riz déjà cuit et des légumes surgelés.",
    "color": "#f5e5cf",
    "kcal": 520,
    "protein": 23,
    "carbs": 75,
    "fat": 13,
    "cost": 1.48,
    "ingredients": [
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.6
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 10,
        "unit": "ml",
        "estimatedCost": 0.04
      }
    ]
  },
  {
    "id": "potato-tuna-salad",
    "name": "Salade pommes de terre et thon",
    "emoji": "🥔",
    "time": 20,
    "category": "Déjeuner",
    "description": "Une salade froide rassasiante, adaptée au batch cooking.",
    "color": "#dfead8",
    "kcal": 490,
    "protein": 35,
    "carbs": 58,
    "fat": 11,
    "cost": 2.09,
    "ingredients": [
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Thon au naturel égoutté",
        "category": "Poisson",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Yaourt nature",
        "category": "Frais",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.15
      },
      {
        "name": "Concombre",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "lentil-bolognese",
    "name": "Bolognaise de lentilles",
    "emoji": "🍝",
    "time": 25,
    "category": "Déjeuner",
    "description": "Une sauce riche et économique pour les pâtes complètes.",
    "color": "#f2dfce",
    "kcal": 560,
    "protein": 27,
    "carbs": 92,
    "fat": 8,
    "cost": 0.91,
    "ingredients": [
      {
        "name": "Lentilles sèches",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.21
      },
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "chicken-wrap",
    "name": "Wrap poulet, yaourt et crudités",
    "emoji": "🌯",
    "time": 15,
    "category": "Déjeuner",
    "description": "Un déjeuner transportable avec une sauce légère.",
    "color": "#e1eee7",
    "kcal": 500,
    "protein": 38,
    "carbs": 48,
    "fat": 14,
    "cost": 2.34,
    "ingredients": [
      {
        "name": "Tortilla de blé",
        "category": "Épicerie",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Poulet",
        "category": "Viandes",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 1.44
      },
      {
        "name": "Yaourt nature",
        "category": "Frais",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Salade",
        "category": "Fruits & légumes",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.25
      }
    ]
  },
  {
    "id": "sardine-potato",
    "name": "Sardines et pommes de terre citronnées",
    "emoji": "🐟",
    "time": 18,
    "category": "Déjeuner",
    "description": "Les sardines en conserve offrent une option économique riche en oméga-3.",
    "color": "#f4dfdc",
    "kcal": 530,
    "protein": 30,
    "carbs": 55,
    "fat": 19,
    "cost": 1.89,
    "ingredients": [
      {
        "name": "Sardines en conserve",
        "category": "Poisson",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.9
      },
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Citron",
        "category": "Fruits & légumes",
        "quantity": 0.5,
        "unit": "pièce",
        "estimatedCost": 0.17
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.32
      }
    ]
  },
  {
    "id": "beef-bulgur",
    "name": "Bœuf haché et boulgour aux tomates",
    "emoji": "🥘",
    "time": 20,
    "category": "Déjeuner",
    "description": "Une portion contrôlée de bœuf avec une céréale abordable.",
    "color": "#f2dfce",
    "kcal": 600,
    "protein": 37,
    "carbs": 69,
    "fat": 18,
    "cost": 3.0,
    "ingredients": [
      {
        "name": "Bœuf haché 5%",
        "category": "Viandes",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 2.16
      },
      {
        "name": "Boulgour",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "whitefish-rice",
    "name": "Colin, riz et brocoli",
    "emoji": "🐟",
    "time": 25,
    "category": "Déjeuner",
    "description": "Poisson surgelé et légumes pour limiter le coût du plat.",
    "color": "#dfead8",
    "kcal": 510,
    "protein": 38,
    "carbs": 69,
    "fat": 8,
    "cost": 2.72,
    "ingredients": [
      {
        "name": "Filet de colin surgelé",
        "category": "Poisson",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.8
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 75,
        "unit": "g",
        "estimatedCost": 0.19
      },
      {
        "name": "Brocoli surgelé",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.67
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "ml",
        "estimatedCost": 0.06
      }
    ]
  },
  {
    "id": "tofu-noodles",
    "name": "Nouilles de riz au tofu et légumes",
    "emoji": "🍜",
    "time": 20,
    "category": "Déjeuner",
    "description": "Une recette végétale inspirée des sautés asiatiques.",
    "color": "#dfeee0",
    "kcal": 560,
    "protein": 25,
    "carbs": 82,
    "fat": 14,
    "cost": 2.02,
    "ingredients": [
      {
        "name": "Tofu nature",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.6
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 10,
        "unit": "ml",
        "estimatedCost": 0.04
      }
    ]
  },
  {
    "id": "bean-quesadilla",
    "name": "Quesadilla haricots rouges et fromage",
    "emoji": "🫓",
    "time": 12,
    "category": "Déjeuner",
    "description": "Un repas rapide avec fibres et protéines, à servir avec une salade.",
    "color": "#f5e5cf",
    "kcal": 520,
    "protein": 25,
    "carbs": 60,
    "fat": 18,
    "cost": 1.27,
    "ingredients": [
      {
        "name": "Tortilla de blé",
        "category": "Épicerie",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Haricots rouges en conserve",
        "category": "Épicerie",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.42
      },
      {
        "name": "Emmental râpé",
        "category": "Frais",
        "quantity": 25,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Salsa tomate",
        "category": "Épicerie",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.2
      }
    ]
  },
  {
    "id": "chicken-couscous",
    "name": "Poulet et semoule aux légumes",
    "emoji": "🍗",
    "time": 22,
    "category": "Déjeuner",
    "description": "Une recette simple à préparer en plusieurs boîtes repas.",
    "color": "#dfead8",
    "kcal": 610,
    "protein": 42,
    "carbs": 82,
    "fat": 11,
    "cost": 2.5,
    "ingredients": [
      {
        "name": "Poulet",
        "category": "Viandes",
        "quantity": 140,
        "unit": "g",
        "estimatedCost": 1.68
      },
      {
        "name": "Semoule complète",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.16
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.4
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "ml",
        "estimatedCost": 0.06
      }
    ]
  },
  {
    "id": "lentil-soup-toast",
    "name": "Soupe de lentilles et tartines",
    "emoji": "🍲",
    "time": 25,
    "category": "Dîner",
    "description": "Un dîner très abordable, nourrissant et facile à congeler.",
    "color": "#e9e4d7",
    "kcal": 470,
    "protein": 25,
    "carbs": 68,
    "fat": 9,
    "cost": 0.73,
    "ingredients": [
      {
        "name": "Lentilles sèches",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.21
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.12
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.2
      }
    ]
  },
  {
    "id": "tofu-curry",
    "name": "Curry de tofu et riz",
    "emoji": "🍛",
    "time": 25,
    "category": "Dîner",
    "description": "Un plat végétal crémeux sans viande ni poisson.",
    "color": "#dfeee0",
    "kcal": 590,
    "protein": 27,
    "carbs": 78,
    "fat": 18,
    "cost": 2.27,
    "ingredients": [
      {
        "name": "Tofu nature",
        "category": "Frais",
        "quantity": 160,
        "unit": "g",
        "estimatedCost": 1.28
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 75,
        "unit": "g",
        "estimatedCost": 0.19
      },
      {
        "name": "Lait de coco léger",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "ml",
        "estimatedCost": 0.32
      },
      {
        "name": "Pâte de curry",
        "category": "Épicerie",
        "quantity": 8,
        "unit": "g",
        "estimatedCost": 0.08
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.4
      }
    ]
  },
  {
    "id": "pasta-egg-spinach",
    "name": "Pâtes aux œufs et épinards",
    "emoji": "🍝",
    "time": 18,
    "category": "Dîner",
    "description": "Une recette de placard simple avec des protéines et des légumes.",
    "color": "#dfead8",
    "kcal": 520,
    "protein": 26,
    "carbs": 72,
    "fat": 14,
    "cost": 1.37,
    "ingredients": [
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 85,
        "unit": "g",
        "estimatedCost": 0.21
      },
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.4
      },
      {
        "name": "Emmental râpé",
        "category": "Frais",
        "quantity": 10,
        "unit": "g",
        "estimatedCost": 0.12
      }
    ]
  },
  {
    "id": "chicken-potato-tray",
    "name": "Poulet et pommes de terre au four",
    "emoji": "🍗",
    "time": 35,
    "category": "Dîner",
    "description": "Un plat à four pratique qui demande peu de surveillance.",
    "color": "#f2dfce",
    "kcal": 590,
    "protein": 42,
    "carbs": 58,
    "fat": 17,
    "cost": 2.6,
    "ingredients": [
      {
        "name": "Poulet",
        "category": "Viandes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.8
      },
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 8,
        "unit": "ml",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "bean-tomato-stew",
    "name": "Ragoût haricots rouges et pommes de terre",
    "emoji": "🥘",
    "time": 25,
    "category": "Dîner",
    "description": "Un dîner végétal à faible coût par portion.",
    "color": "#dfeee0",
    "kcal": 510,
    "protein": 21,
    "carbs": 83,
    "fat": 9,
    "cost": 1.27,
    "ingredients": [
      {
        "name": "Haricots rouges en conserve",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.53
      },
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 0.4
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "turkey-rice-tomato",
    "name": "Dinde tomate et riz",
    "emoji": "🍅",
    "time": 22,
    "category": "Dîner",
    "description": "Une recette maigre, riche en protéines et facile à portionner.",
    "color": "#dfead8",
    "kcal": 560,
    "protein": 43,
    "carbs": 72,
    "fat": 9,
    "cost": 2.79,
    "ingredients": [
      {
        "name": "Dinde",
        "category": "Viandes",
        "quantity": 140,
        "unit": "g",
        "estimatedCost": 1.96
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 75,
        "unit": "g",
        "estimatedCost": 0.19
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.4
      }
    ]
  },
  {
    "id": "chickpea-spinach-curry",
    "name": "Curry pois chiches-épinards",
    "emoji": "🌱",
    "time": 20,
    "category": "Dîner",
    "description": "Un plat végétarien économique à servir avec du riz.",
    "color": "#dfeee0",
    "kcal": 540,
    "protein": 22,
    "carbs": 80,
    "fat": 15,
    "cost": 1.37,
    "ingredients": [
      {
        "name": "Pois chiches en conserve",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.53
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.4
      },
      {
        "name": "Lait de coco léger",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "ml",
        "estimatedCost": 0.24
      },
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.15
      },
      {
        "name": "Pâte de curry",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "g",
        "estimatedCost": 0.05
      }
    ]
  },
  {
    "id": "tuna-potato-gratin",
    "name": "Gratin léger thon et pommes de terre",
    "emoji": "🥔",
    "time": 30,
    "category": "Dîner",
    "description": "Un plat familial qui se prépare avec des ingrédients simples.",
    "color": "#f4dfdc",
    "kcal": 520,
    "protein": 36,
    "carbs": 57,
    "fat": 14,
    "cost": 2.16,
    "ingredients": [
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Thon au naturel égoutté",
        "category": "Poisson",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.28
      },
      {
        "name": "Emmental râpé",
        "category": "Frais",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.18
      }
    ]
  },
  {
    "id": "beef-tomato-pasta",
    "name": "Pâtes bolognaise express",
    "emoji": "🍝",
    "time": 22,
    "category": "Dîner",
    "description": "Une version simple de la bolognaise avec une portion mesurée de viande.",
    "color": "#f2dfce",
    "kcal": 620,
    "protein": 36,
    "carbs": 80,
    "fat": 16,
    "cost": 2.4,
    "ingredients": [
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 90,
        "unit": "g",
        "estimatedCost": 0.23
      },
      {
        "name": "Bœuf haché 5%",
        "category": "Viandes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.8
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.07
      }
    ]
  },
  {
    "id": "shakshuka-beans",
    "name": "Shakshuka aux haricots",
    "emoji": "🍳",
    "time": 20,
    "category": "Dîner",
    "description": "Œufs, tomate et haricots pour un dîner économique.",
    "color": "#f5e5cf",
    "kcal": 480,
    "protein": 26,
    "carbs": 49,
    "fat": 18,
    "cost": 1.52,
    "ingredients": [
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 2,
        "unit": "pièce",
        "estimatedCost": 0.64
      },
      {
        "name": "Haricots rouges en conserve",
        "category": "Épicerie",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.35
      },
      {
        "name": "Coulis de tomate",
        "category": "Épicerie",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.3
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.16
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 30,
        "unit": "g",
        "estimatedCost": 0.07
      }
    ]
  },
  {
    "id": "fish-couscous",
    "name": "Colin et semoule aux légumes",
    "emoji": "🐟",
    "time": 25,
    "category": "Dîner",
    "description": "Un dîner léger et protéiné avec du poisson surgelé.",
    "color": "#dfead8",
    "kcal": 500,
    "protein": 38,
    "carbs": 68,
    "fat": 7,
    "cost": 2.87,
    "ingredients": [
      {
        "name": "Filet de colin surgelé",
        "category": "Poisson",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.8
      },
      {
        "name": "Semoule complète",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.18
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 180,
        "unit": "g",
        "estimatedCost": 0.72
      },
      {
        "name": "Citron",
        "category": "Fruits & légumes",
        "quantity": 0.5,
        "unit": "pièce",
        "estimatedCost": 0.17
      }
    ]
  },
  {
    "id": "tofu-peanut-noodles",
    "name": "Nouilles tofu-cacahuète",
    "emoji": "🍜",
    "time": 20,
    "category": "Dîner",
    "description": "Une sauce cacahuète dosée pour apporter du goût et des lipides.",
    "color": "#dfeee0",
    "kcal": 600,
    "protein": 28,
    "carbs": 75,
    "fat": 20,
    "cost": 2.01,
    "ingredients": [
      {
        "name": "Tofu nature",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 75,
        "unit": "g",
        "estimatedCost": 0.19
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 12,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 10,
        "unit": "ml",
        "estimatedCost": 0.04
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.48
      }
    ]
  },
  {
    "id": "stuffed-potato-tuna",
    "name": "Pomme de terre farcie au thon",
    "emoji": "🥔",
    "time": 30,
    "category": "Dîner",
    "description": "Un dîner économique qui utilise peu d’ingrédients.",
    "color": "#f4dfdc",
    "kcal": 480,
    "protein": 34,
    "carbs": 58,
    "fat": 10,
    "cost": 2.15,
    "ingredients": [
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 300,
        "unit": "g",
        "estimatedCost": 0.6
      },
      {
        "name": "Thon au naturel égoutté",
        "category": "Poisson",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.21
      },
      {
        "name": "Maïs en conserve",
        "category": "Épicerie",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.14
      }
    ]
  },
  {
    "id": "lentil-shepherd-pie",
    "name": "Parmentier de lentilles",
    "emoji": "🥧",
    "time": 35,
    "category": "Dîner",
    "description": "Une version végétale du hachis, adaptée à la préparation en avance.",
    "color": "#e9e4d7",
    "kcal": 520,
    "protein": 23,
    "carbs": 82,
    "fat": 10,
    "cost": 1.0,
    "ingredients": [
      {
        "name": "Lentilles sèches",
        "category": "Épicerie",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Pommes de terre",
        "category": "Fruits & légumes",
        "quantity": 250,
        "unit": "g",
        "estimatedCost": 0.5
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.16
      },
      {
        "name": "Oignon",
        "category": "Fruits & légumes",
        "quantity": 40,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "chicken-pesto-pasta",
    "name": "Pâtes poulet-pesto",
    "emoji": "🍝",
    "time": 20,
    "category": "Dîner",
    "description": "Un plat simple à ajuster en réduisant ou augmentant les pâtes.",
    "color": "#dfead8",
    "kcal": 630,
    "protein": 43,
    "carbs": 74,
    "fat": 17,
    "cost": 2.03,
    "ingredients": [
      {
        "name": "Pâtes complètes",
        "category": "Épicerie",
        "quantity": 85,
        "unit": "g",
        "estimatedCost": 0.21
      },
      {
        "name": "Poulet",
        "category": "Viandes",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 1.44
      },
      {
        "name": "Pesto",
        "category": "Épicerie",
        "quantity": 12,
        "unit": "g",
        "estimatedCost": 0.14
      },
      {
        "name": "Épinards surgelés",
        "category": "Fruits & légumes",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "veggie-fried-rice",
    "name": "Riz sauté au tofu et légumes",
    "emoji": "🍚",
    "time": 18,
    "category": "Dîner",
    "description": "Une option végétale pour utiliser les restes de riz.",
    "color": "#dfeee0",
    "kcal": 510,
    "protein": 23,
    "carbs": 76,
    "fat": 12,
    "cost": 1.91,
    "ingredients": [
      {
        "name": "Riz",
        "category": "Épicerie",
        "quantity": 75,
        "unit": "g",
        "estimatedCost": 0.19
      },
      {
        "name": "Tofu nature",
        "category": "Frais",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.96
      },
      {
        "name": "Légumes surgelés",
        "category": "Fruits & légumes",
        "quantity": 180,
        "unit": "g",
        "estimatedCost": 0.72
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 10,
        "unit": "ml",
        "estimatedCost": 0.04
      }
    ]
  },
  {
    "id": "skyr-apple",
    "name": "Skyr et pomme",
    "emoji": "🍎",
    "time": 2,
    "category": "Collation",
    "description": "Collation riche en protéines avec un fruit.",
    "color": "#e1eee7",
    "kcal": 210,
    "protein": 22,
    "carbs": 27,
    "fat": 1,
    "cost": 1.37,
    "ingredients": [
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 170,
        "unit": "g",
        "estimatedCost": 1.02
      },
      {
        "name": "Pomme",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      }
    ]
  },
  {
    "id": "cottage-crackers",
    "name": "Cottage cheese et galettes de riz",
    "emoji": "🍘",
    "time": 3,
    "category": "Collation",
    "description": "Une collation salée facile à emporter.",
    "color": "#e1eee7",
    "kcal": 190,
    "protein": 20,
    "carbs": 23,
    "fat": 4,
    "cost": 1.2,
    "ingredients": [
      {
        "name": "Cottage cheese",
        "category": "Frais",
        "quantity": 120,
        "unit": "g",
        "estimatedCost": 0.96
      },
      {
        "name": "Galettes de riz",
        "category": "Épicerie",
        "quantity": 3,
        "unit": "pièce",
        "estimatedCost": 0.24
      }
    ]
  },
  {
    "id": "banana-peanut-oats",
    "name": "Banane, avoine et cacahuète",
    "emoji": "🥜",
    "time": 3,
    "category": "Collation",
    "description": "Une collation énergétique pour les jours d’entraînement.",
    "color": "#f2dfce",
    "kcal": 300,
    "protein": 9,
    "carbs": 42,
    "fat": 11,
    "cost": 0.5,
    "ingredients": [
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      },
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 25,
        "unit": "g",
        "estimatedCost": 0.07
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 10,
        "unit": "g",
        "estimatedCost": 0.08
      }
    ]
  },
  {
    "id": "yogurt-raisins",
    "name": "Fromage blanc et raisins secs",
    "emoji": "🥣",
    "time": 2,
    "category": "Collation",
    "description": "Une option économique à glucides rapides et protéines.",
    "color": "#e9e4d7",
    "kcal": 200,
    "protein": 18,
    "carbs": 28,
    "fat": 2,
    "cost": 0.82,
    "ingredients": [
      {
        "name": "Fromage blanc 0%",
        "category": "Frais",
        "quantity": 200,
        "unit": "g",
        "estimatedCost": 0.7
      },
      {
        "name": "Raisins secs",
        "category": "Fruits & légumes",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.12
      }
    ]
  },
  {
    "id": "egg-toast-snack",
    "name": "Œuf dur et tartine",
    "emoji": "🥚",
    "time": 10,
    "category": "Collation",
    "description": "Une collation salée riche en protéines.",
    "color": "#f5e5cf",
    "kcal": 220,
    "protein": 13,
    "carbs": 23,
    "fat": 8,
    "cost": 0.5,
    "ingredients": [
      {
        "name": "Œufs",
        "category": "Frais",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.32
      },
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 45,
        "unit": "g",
        "estimatedCost": 0.18
      }
    ]
  },
  {
    "id": "hummus-carrot",
    "name": "Houmous express et carottes",
    "emoji": "🥕",
    "time": 5,
    "category": "Collation",
    "description": "Une collation végétale avec des légumes croquants.",
    "color": "#dfeee0",
    "kcal": 180,
    "protein": 7,
    "carbs": 25,
    "fat": 6,
    "cost": 0.57,
    "ingredients": [
      {
        "name": "Pois chiches en conserve",
        "category": "Épicerie",
        "quantity": 70,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Carottes",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.2
      },
      {
        "name": "Citron",
        "category": "Fruits & légumes",
        "quantity": 0.25,
        "unit": "pièce",
        "estimatedCost": 0.09
      },
      {
        "name": "Huile d’olive",
        "category": "Épicerie",
        "quantity": 3,
        "unit": "ml",
        "estimatedCost": 0.04
      }
    ]
  },
  {
    "id": "ricecake-peanut",
    "name": "Galettes de riz au beurre de cacahuète",
    "emoji": "🍘",
    "time": 2,
    "category": "Collation",
    "description": "Très rapide et pratique avant une séance.",
    "color": "#f2dfce",
    "kcal": 220,
    "protein": 7,
    "carbs": 28,
    "fat": 10,
    "cost": 0.34,
    "ingredients": [
      {
        "name": "Galettes de riz",
        "category": "Épicerie",
        "quantity": 3,
        "unit": "pièce",
        "estimatedCost": 0.24
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 12,
        "unit": "g",
        "estimatedCost": 0.1
      }
    ]
  },
  {
    "id": "milk-banana",
    "name": "Lait et banane",
    "emoji": "🥛",
    "time": 2,
    "category": "Collation",
    "description": "Une collation simple avec glucides et protéines.",
    "color": "#f2dfce",
    "kcal": 210,
    "protein": 9,
    "carbs": 38,
    "fat": 4,
    "cost": 0.73,
    "ingredients": [
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 250,
        "unit": "ml",
        "estimatedCost": 0.38
      },
      {
        "name": "Banane",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.35
      }
    ]
  },
  {
    "id": "tuna-toast-snack",
    "name": "Tartine au thon",
    "emoji": "🥪",
    "time": 5,
    "category": "Collation",
    "description": "Une collation salée avec une bonne teneur en protéines.",
    "color": "#f4dfdc",
    "kcal": 230,
    "protein": 21,
    "carbs": 25,
    "fat": 4,
    "cost": 0.94,
    "ingredients": [
      {
        "name": "Pain complet",
        "category": "Boulangerie",
        "quantity": 55,
        "unit": "g",
        "estimatedCost": 0.22
      },
      {
        "name": "Thon au naturel égoutté",
        "category": "Poisson",
        "quantity": 60,
        "unit": "g",
        "estimatedCost": 0.72
      }
    ]
  },
  {
    "id": "soy-yogurt-fruit",
    "name": "Yaourt soja et fruits rouges",
    "emoji": "🌱",
    "time": 2,
    "category": "Collation",
    "description": "Une option végétale et légère.",
    "color": "#dfeee0",
    "kcal": 150,
    "protein": 7,
    "carbs": 22,
    "fat": 4,
    "cost": 1.5,
    "ingredients": [
      {
        "name": "Yaourt soja nature",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.6
      },
      {
        "name": "Fruits rouges surgelés",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.9
      }
    ]
  },
  {
    "id": "cocoa-oat-bites",
    "name": "Bouchées avoine-cacao",
    "emoji": "🍫",
    "time": 10,
    "category": "Collation",
    "description": "Prépare plusieurs portions à l’avance pour la semaine.",
    "color": "#eadfd4",
    "kcal": 240,
    "protein": 7,
    "carbs": 35,
    "fat": 8,
    "cost": 0.38,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 35,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Beurre de cacahuète",
        "category": "Épicerie",
        "quantity": 8,
        "unit": "g",
        "estimatedCost": 0.06
      },
      {
        "name": "Cacao non sucré",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "g",
        "estimatedCost": 0.07
      },
      {
        "name": "Dattes",
        "category": "Fruits & légumes",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.15
      }
    ]
  },
  {
    "id": "orange-skyr",
    "name": "Skyr et orange",
    "emoji": "🍊",
    "time": 2,
    "category": "Collation",
    "description": "Protéines et fruit, sans préparation.",
    "color": "#f4dfdc",
    "kcal": 190,
    "protein": 19,
    "carbs": 25,
    "fat": 1,
    "cost": 1.3,
    "ingredients": [
      {
        "name": "Skyr",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 0.9
      },
      {
        "name": "Orange",
        "category": "Fruits & légumes",
        "quantity": 1,
        "unit": "pièce",
        "estimatedCost": 0.4
      }
    ]
  },
  {
    "id": "cottage-tomato",
    "name": "Cottage cheese et tomates",
    "emoji": "🍅",
    "time": 3,
    "category": "Collation",
    "description": "Une collation fraîche, riche en protéines et pauvre en sucre ajouté.",
    "color": "#e1eee7",
    "kcal": 160,
    "protein": 19,
    "carbs": 10,
    "fat": 5,
    "cost": 1.7,
    "ingredients": [
      {
        "name": "Cottage cheese",
        "category": "Frais",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.2
      },
      {
        "name": "Tomates",
        "category": "Fruits & légumes",
        "quantity": 100,
        "unit": "g",
        "estimatedCost": 0.5
      }
    ]
  },
  {
    "id": "edamame-snack",
    "name": "Edamame vapeur",
    "emoji": "🌱",
    "time": 8,
    "category": "Collation",
    "description": "Une collation végétale riche en protéines et fibres.",
    "color": "#dfeee0",
    "kcal": 190,
    "protein": 18,
    "carbs": 15,
    "fat": 7,
    "cost": 1.37,
    "ingredients": [
      {
        "name": "Edamame surgelés",
        "category": "Fruits & légumes",
        "quantity": 150,
        "unit": "g",
        "estimatedCost": 1.35
      },
      {
        "name": "Sauce soja",
        "category": "Épicerie",
        "quantity": 5,
        "unit": "ml",
        "estimatedCost": 0.02
      }
    ]
  },
  {
    "id": "pita-yogurt",
    "name": "Mini pita et sauce yaourt",
    "emoji": "🥙",
    "time": 4,
    "category": "Collation",
    "description": "Une collation salée à personnaliser avec les herbes disponibles.",
    "color": "#e1eee7",
    "kcal": 210,
    "protein": 10,
    "carbs": 35,
    "fat": 4,
    "cost": 0.62,
    "ingredients": [
      {
        "name": "Pain pita",
        "category": "Boulangerie",
        "quantity": 0.5,
        "unit": "pièce",
        "estimatedCost": 0.23
      },
      {
        "name": "Yaourt nature",
        "category": "Frais",
        "quantity": 80,
        "unit": "g",
        "estimatedCost": 0.24
      },
      {
        "name": "Concombre",
        "category": "Fruits & légumes",
        "quantity": 50,
        "unit": "g",
        "estimatedCost": 0.15
      }
    ]
  },
  {
    "id": "protein-oats",
    "name": "Crème avoine protéinée",
    "emoji": "🥣",
    "time": 6,
    "category": "Collation",
    "description": "Option facultative avec whey, remplaçable par du skyr.",
    "color": "#e9e4d7",
    "kcal": 280,
    "protein": 25,
    "carbs": 37,
    "fat": 5,
    "cost": 0.86,
    "ingredients": [
      {
        "name": "Flocons d’avoine",
        "category": "Épicerie",
        "quantity": 35,
        "unit": "g",
        "estimatedCost": 0.1
      },
      {
        "name": "Lait",
        "category": "Frais",
        "quantity": 150,
        "unit": "ml",
        "estimatedCost": 0.23
      },
      {
        "name": "Whey protéine (facultatif)",
        "category": "Épicerie",
        "quantity": 15,
        "unit": "g",
        "estimatedCost": 0.53
      }
    ]
  }
];
