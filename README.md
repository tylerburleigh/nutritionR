# nutritionR
A wrapper for the Nutritionix API (https://www.nutritionix.com), allowing nutritional analysis of foods and recipes expressed in natural language.

# Requirements

Requires a Nutritionix API key (it's free!). Go to https://developer.nutritionix.com

# Installation / getting started

1. Install the package

```
devtools::install_github("tylerburleigh/nutritionR")
```

2. Load the package and set your API keys

```
library("nutritionR")
Sys.setenv(NUTRITIONIX_APP_ID = "MY_APP_ID")
Sys.setenv(NUTRITIONIX_API_KEY = "MY_API_KEY")
```

# How do I use `nutritionR`?

This package has two functions:

## `nutritionix_lookup()`

`nutritionix_lookup()` takes a natural language food query as input, and it sends this query to the Nutritionix API and then returns an list object with all sorts of nutrition information. You can look at this object, but you will probably want to just save this object and send it to the next function.

For example, let's say you wanted to query Nutritionix with "A hamburger with cheese".

```
obj <- nutritionix_lookup("A hamburger with cheese")
```

## `nutrient()`

`nutrient()` takes a nutrition object returned by `nutritionix_lookup()` and a nutrient as input, and returns the information about that nutrient. For example, let's say you wanted to know how many calories were in your query "A hamburger with cheese".

```
obj <- nutritionix_lookup("A hamburger with cheese")
nutrient(obj, "calories")
```

# Great, now what nutrients can I lookup?

Currently, 68 nutrients are supported. 
This includes macronutrients like fat, protein, carbs, calories, and also micronutrients, vitamins, and minerals.

The full list of nutrients is as follows:

- calcium
- carbohydrate
- cholesterol
- calories
- saturated fat
- fat
- trans fat
- iron
- fiber
- potassium
- sodium
- protein
- sugar
- vitamin d
- alanine
- alcohol
- arginine
- ash
- aspartic acid
- caffeine
- carotene alpha
- carotene beta
- choline
- cryptoxanthin
- copper
- cystine
- energy
- monosaturated fat
- polysaturated fat
- folate
- folic acid
- folate
- glutamic acid
- glycine
- histidine
- isoleucine
- leucine
- lutein and zeaxanthin
- lycopene
- lysine
- methionine
- magnesium
- manganese
- niacin
- phosphorus
- pantothenic acid
- phenylalanine
- proline
- retinol
- riboflavin
- selenium
- serine
- theobromine
- thiamin
- threonin
- vitamin e
- tryptophan
- tyrosine
- valine
- vitamin a
- vitamin a
- vitamin b12
- vitamin b-6
- vitamin c
- vitamin d2 and d3
- vitamin k
- water
- zinc

This list can also be accessed with `data(nutrients)`


