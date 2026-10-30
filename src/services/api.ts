import type { Recipe } from "../types";

const API_BASE =
  import.meta.env.VITE_API_URL ?? "http://localhost:8080/api";

export type ApiUser = {
  id: number;
  email: string;
  name: string;
};

export type AuthResponse = {
  token: string;
  user: ApiUser;
};

export type ApiFavorite = {
  id: string;
  name: string;
  category: string;
  cost: number;
};

export async function apiRequest<T>(
  path: string,
  options: RequestInit = {},
  token?: string
): Promise<T> {
  const response = await fetch(`${API_BASE}${path}`, {
    ...options,
    headers: {
      "Content-Type": "application/json",
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
      ...options.headers,
    },
  });

  if (!response.ok) {
    let message = `Erreur API (${response.status})`;

    try {
      const body = await response.json();
      message = body.message ?? message;
    } catch {
      // Conserver le message par défaut si la réponse n'est pas du JSON.
    }

    throw new Error(message);
  }

  if (response.status === 204) {
    return undefined as T;
  }

  return response.json() as Promise<T>;
}

export const mealPilotApi = {
  // Vérifier que le backend est disponible
  health: () =>
    apiRequest<{ status: string; service?: string }>("/health"),

  // Récupérer les recettes
  recipes: (query = "") =>
    apiRequest<Recipe[]>(
      `/recipes${query ? `?${query}` : ""}`
    ),

  // Créer un compte
  register: (name: string, email: string, password: string) =>
    apiRequest<AuthResponse>("/auth/register", {
      method: "POST",
      body: JSON.stringify({ name, email, password }),
    }),

  // Se connecter
  login: (email: string, password: string) =>
    apiRequest<AuthResponse>("/auth/login", {
      method: "POST",
      body: JSON.stringify({ email, password }),
    }),

  // Se déconnecter
  logout: (token: string) =>
    apiRequest<{ status: string }>(
      "/auth/logout",
      {
        method: "POST",
      },
      token
    ),

  // Récupérer le profil utilisateur
  profile: (token: string) =>
    apiRequest<Record<string, unknown>>(
      "/profile",
      {},
      token
    ),

  // Enregistrer le profil utilisateur
  saveProfile: (
    token: string,
    profile: Record<string, unknown>
  ) =>
    apiRequest<Record<string, unknown>>(
      "/profile",
      {
        method: "PUT",
        body: JSON.stringify(profile),
      },
      token
    ),

  // Récupérer les favoris de l'utilisateur connecté
  favorites: (token: string) =>
    apiRequest<ApiFavorite[]>(
      "/favorites",
      {},
      token
    ),

  // Ajouter une recette aux favoris
  addFavorite: (token: string, recipeId: string) =>
    apiRequest<{ status: string }>(
      `/favorites/${encodeURIComponent(recipeId)}`,
      {
        method: "POST",
      },
      token
    ),

  // Supprimer une recette des favoris
  removeFavorite: (token: string, recipeId: string) =>
    apiRequest<{ status: string }>(
      `/favorites/${encodeURIComponent(recipeId)}`,
      {
        method: "DELETE",
      },
      token
    ),
};