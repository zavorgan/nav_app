import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displaedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //забираем мапу из готового списка
    //через запрос переданный в списов в экране категорий
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    //получаем значение из мапы ид и титле
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    //получаем ид со списка блюд
    displaedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displaedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
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
            id: displaedMeals[index].id,
            title: displaedMeals[index].title,
            imageUrl: displaedMeals[index].imageUrl,
            duration: displaedMeals[index].duration,
            complexity: displaedMeals[index].complexity,
            affordability: displaedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displaedMeals.length,
      ),
    );
  }
}
