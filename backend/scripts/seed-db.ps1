$ErrorActionPreference = "Stop"
Get-Content ".\src\main\resources\db\seed-recipes.sql" -Raw | docker exec -i mealpilot-postgres psql -U mealpilot -d mealpilot
Write-Host "Catalogue MealPilot importé dans PostgreSQL."
