# nutritionR
A wrapper for the Paprika and Nutritionix APIs, allowing nutritional analysis of recipes stored in Paprika using natural language processing via Nutritionix.

# Requirements to use

Requires a Paprika Cloud Sync account (paid, $20) and a Nutritionix API key (free)

# Installation

```
install.packages("devtools")
devtools::install_github("tylerburleigh/nutritionR")
```

# Vignette

## 1. Set credentials for Paprika and Nutritionix

```
install_paprika_creds("MyUsername", "MyPassword")
install_nutritionix_creds("MyAppID", "MyAPIKey")
```

## 2. Fetch recipe list from Paprika

```
recipes <- get_recipes_list()
recipes
```

## 3. Get details for first recipe in recipes list

```
recipe_detail <- get_recipe_detail(recipes$uid[1])
recipe_detail
```

## 4. Get calories using recipe ingredients

```
calories <- get_recipe_detail(recipe_detail$ingredients)
calories
```
