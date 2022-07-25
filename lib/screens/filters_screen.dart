import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  //принимаем значения с мэйна в функцию сохранения
  final Function saveFilters;

  const FiltersScreen(this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(String title, String desription, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desription),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильты'),
        actions: <Widget>[
          //используем значение переданное в начале из мэйна через виджет.значение
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegitarian': _vegetarian,
                };

                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Вы можете изменить фильтр',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    'Без глютена',
                    'Показать только блюда без глютена',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Без лактозы',
                    'Показать только блюда без лактозы',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Вегитарианские',
                    'Показать только вегитарианские блюда вегитарианские',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Веганские', 'Показать только веганские блюда', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
