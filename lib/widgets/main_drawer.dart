import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  //создаем виджет для построения списка внутри меню

  Widget buildListTile(String title, IconData icon, Function TapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          // fontWeight: FontWeight.bold,
        ),
      ),
      onTap: TapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).highlightColor,
            child: Text(
              'Готовим еду!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                // color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

//после рефакторинга
          buildListTile('Еда', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Фильтры', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),

// первый способ построения
          // ListTile(
          //   leading: Icon(
          //     Icons.restaurant,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Еда',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {
          //     //...
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Настройки',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {
          //     //...
          //   },
          // ),
        ],
      ),
    );
  }
}
