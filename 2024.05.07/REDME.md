В една рецепта може да има една съставка само един път

Една рецепта трябва ЗАДЪЛЖИТЕЛНО да има 'Шеф'

uuid трябва или да е default или да се записва правилно при вкарване на данни


## Заявки
- Изведете всеки [chefs.name, recipes.title] за всяка рецепта.
- Сортирайте рецептите по брой веган съставки във низходящ ред
- Намерете всички рецепти, които имат метаданна "recipe.nutrition.calories" повече от 200
- Намерете всички рецепти, които нямат стойност за медатаданната "recipe.cuisine"

## Примерна metadata
```
{
  "recipe": {
    "title": "Classic Tomato Spaghetti",
    "cuisine": "Italian",
    "category": "Main Course",
    "servings": 4,
    "cookingTime": "30 minutes",
    "nutrition": {
      "calories": 480,
      "protein": "14g",
      "fat": "10g",
      "carbohydrates": "83g"
    }
  }
}
```