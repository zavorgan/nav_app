import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       headline6: TextStyle(
        //         fontFamily: 'RobotoCondensed',
        //         fontSize: 24,
        //       ),
        //     ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', //главная страница
      //создаем адреса(роуты) для перенаправления страниц

      routes: {
        //главный экран с категориями
        '/': (ctx) => CategoriesScreen(),

        //экран подкатегории
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen()
      },
    );
  }
}
