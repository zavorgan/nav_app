import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_scrren.dart';
import './screens/meal_dedail.screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //принимаем значения для фильтров
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegitarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

//проверка фильтра (по хз как работает, ....)
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegitarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                // fontFamily: 'RobotoCondensed',
                fontSize: 24,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', //главная страница
      //создаем адреса(роуты) для перенаправления страниц

      routes: {
        //главный экран с категориями
        '/': (ctx) => TabsScreen(),

        //экран подкатегории
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (setting) {
      //   print(setting.arguments);
      //   return MaterialPageRoute(
      //     builder: ((ctx) => CategoriesScreen()),
      //   );
      // },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: ((ctx) => CategoriesScreen()),
        );
      },
    );
  }
}
