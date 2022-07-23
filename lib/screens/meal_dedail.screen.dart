import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

//рефакторинг выносим контейнер с заголовком,
//после только используем текст необходимы для вывода
  Widget buildSectionTItle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  //еще рефакторинг контейнера в который передать можно еще виджеты
  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //получаем из роута данные(получаем ID переданногоо блюда)
    final mealId = ModalRoute.of(context).settings.arguments as String;

    //получаем все данные по ид сравнивая ид в списке dummy с ид по которому пришли

    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          /**------------------------------------------------------------------------- */
          children: <Widget>[
            /**++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

            //картинка сверху
            Container(
              height: 300,
              width: double.infinity,

              //добавляем картинку из переменной selectMeal через точку
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            /**---------------------------------------------------------------------------*/
            //Заголовок ингридиенты
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   child: Text(
            //     'Ингридиенты',
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),

            //второй вариант через виджет после рефакторинга
            buildSectionTItle(context, 'Ингридиенты'),

            /**---------------------------------------------------------------------------*/

            //Контейнер со списком ингридиентов
            // Container(
            //   margin: EdgeInsets.symmetric(
            //     horizontal: 10,
            //     vertical: 10,
            //   ),
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(10)),
            //   height: 150,
            //   width: double.infinity,
            //   //бидер для ингридиентов
            //   child: ListView.builder(
            //     //получаем список ингридиентов
            //     itemBuilder: (context, index) => Card(
            //       // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //       color: Theme.of(context).accentColor,
            //       child: Container(
            //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //           child: Text(selectMeal.ingredients[index])),
            //     ),
            //     //получаем количесво строк для билдера из списка ингридиентов конкретного блюда
            //     itemCount: selectMeal.ingredients.length,
            //   ),
            // ),

            //после рефакторинга
            buildContainer(
              ListView.builder(
                //получаем список ингридиентов
                itemBuilder: (context, index) => Card(
                  // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: Theme.of(context).accentColor,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectMeal.ingredients[index])),
                ),
                //получаем количесво строк для билдера из списка ингридиентов конкретного блюда
                itemCount: selectMeal.ingredients.length,
              ),
            ),

            /**---------------------------------------------------------------------------*/

            buildSectionTItle(context, 'Способ приготовления'),

            /**---------------------------------------------------------------------------*/

            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectMeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
