import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';

import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //берем мапу, и присваеваем значения которые нужны страниц которые будут в табах по порядку
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Категории'},
    {'page': FavoritesScreen(), 'title': 'Ваш выбор'},
  ];

  int _selectedPageIndex = 0;

//функция для перемещения по табам
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return

/** Первый вариант с табами свеху с прямой навигацией ------------------------*/

        // DefaultTabController(
        //   length: 2,//количество табов
        //   child: Scaffold(
        //       appBar: AppBar(
        //         title: Text('Блюда'),
        //         bottom: TabBar(tabs: <Widget>[
        //           Tab(
        //             icon: Icon(Icons.category),
        //             text: 'Категории',
        //           ),
        //           Tab(
        //             icon: Icon(Icons.favorite),
        //             text: 'Избранное',
        //           ),
        //         ]),
        //       ),
        //       body: TabBarView(children: <Widget>[
        //         CategoriesScreen(),//адреса табов
        //         FavoritesScreen(),
        //       ])),
        // );

        /** Второй вариант табы снизу-------------------------------------------- */

        Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      //отображаем выбранную страницу из списка страниц через индекс
      body: _pages[_selectedPageIndex]['page'], //
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                label: 'Категории'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                label: 'Избранное'),
          ]),
    );
  }
}
