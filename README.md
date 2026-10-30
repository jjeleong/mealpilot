# MealPilot V3 — Full-stack SQL edition

Cette version ajoute un backend Java/Spring Boot et PostgreSQL à l'interface React + TypeScript existante.

## Architecture
- `src/` : interface React/Vite existante et catalogue local de démonstration (80 recettes).
- `src/services/api.ts` : client API prêt à être utilisé depuis le frontend.
- `backend/` : API REST Spring Boot, authentification par mot de passe haché BCrypt, profil, favoris, plannings et journal nutritionnel.
- `backend/src/main/resources/db/schema.sql` : schéma SQL version initiale.
- `backend/src/main/resources/db/seed-recipes.sql` : import des 80 recettes et de leurs ingrédients.
- `docker-compose.yml` : PostgreSQL pour le développement local.

## Prérequis
- Node.js 20+ et npm
- Java 21+
- Maven 3.9+ (ou `mvnw` si tu en ajoutes un)
- Docker Desktop

## Démarrage Windows / PowerShell

### 1. Démarrer PostgreSQL
Depuis la racine du projet :
```powershell
docker compose up -d postgres
```
Le premier démarrage crée la base `mealpilot`, les tables et importe automatiquement les recettes. Pour réinitialiser la base de démonstration (⚠️ supprime toutes les données locales) :
```powershell
docker compose down -v
docker compose up -d postgres
```

Identifiants locaux de développement :
- Base : `mealpilot`
- Utilisateur SQL : `mealpilot`
- Mot de passe SQL : `mealpilot_dev_password`
- Port : `5432`

**Ne réutilise pas ces identifiants en production.**

### 2. Démarrer l'API Java
Dans un autre terminal :
```powershell
cd backend
mvn spring-boot:run
```
API : `http://localhost:8080/api` ; contrôle santé : `http://localhost:8080/api/health`.

Pour créer le package :
```powershell
mvn clean package
```

### 3. Démarrer React
Dans un troisième terminal à la racine du projet :
```powershell
npm install
npm run dev
```
Interface : `http://localhost:5173`.

Le frontend historique continue à fonctionner en mode démonstration avec `localStorage`. Le client API se trouve dans `src/services/api.ts` et est configuré via `.env` (copie `.env.example` en `.env`). Les flux d'authentification et les écrans existants ne basculent pas encore automatiquement vers l'API : cette intégration UI doit être faite avant de considérer le produit comme entièrement connecté à SQL.

## Endpoints API disponibles
- `GET /api/health`
- `GET /api/recipes?category=Déjeuner&q=poulet&maxCost=3`
- `POST /api/auth/register` body `{"name":"Alex","email":"alex@example.com","password":"motdepasse123"}`
- `POST /api/auth/login` body `{"email":"alex@example.com","password":"motdepasse123"}`
- `POST /api/auth/logout` avec `Authorization: Bearer <token>`
- `GET /api/me`, `GET /api/profile`, `PUT /api/profile`
- `GET /api/favorites`, `POST /api/favorites/{recipeId}`, `DELETE /api/favorites/{recipeId}`
- `GET /api/plans`, `PUT /api/plans/{weekStart}` (ex. `2026-10-26`), `GET /api/plans/{weekStart}/meals`
- `POST /api/food-logs`, `GET /api/food-logs?days=14`

Exemple PowerShell de test :
```powershell
$body = @{ email = 'demo@example.com'; password = 'unMotDePasseFort123'; name = 'Demo' } | ConvertTo-Json
$auth = Invoke-RestMethod -Method Post -Uri http://localhost:8080/api/auth/register -ContentType 'application/json' -Body $body
$token = $auth.token
Invoke-RestMethod -Uri http://localhost:8080/api/recipes -Headers @{ Authorization = "Bearer $token" }
```

## Notes importantes
- Les prix sont estimatifs, non connectés aux tarifs en temps réel d'une enseigne.
- Les macros des recettes sont des estimations de démonstration ; vérifie-les avant usage nutritionnel précis.
- Le token de session de cette première API est conservé en mémoire du serveur et sera invalidé au redémarrage. Pour une mise en production, prévoir une stratégie de session/JWT robuste, HTTPS, limitation des tentatives, validation renforcée, migrations versionnées (Flyway), secrets par variables d'environnement et tests.
- Le mot de passe n'est jamais stocké en clair côté API : BCrypt est utilisé.
