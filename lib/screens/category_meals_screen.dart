import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //забираем мапу из готового списка
    //через запрос переданный в списов в экране категорий

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    //получаем значение из мапы ид и титле

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    //получаем ид со списка блюд
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    //передаем ешеду на экран

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //создаем лист с карточками блюд
      body: ListView.builder(
        //запрашиваем индекс со списка блюд из листа впеременной
        itemBuilder: (ctx, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
