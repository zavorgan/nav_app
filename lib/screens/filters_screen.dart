import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  //принимаем значения с мэйна в функцию сохранения
  final Function saveFilters;
  final Map<String, bool> currentFiltres;

  const FiltersScreen(this.currentFiltres, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  //переменные для определения состояния перелючателей
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  //переопределяем значения переменных в фильтре полученных из мейна
  @override
  void initState() {
    _glutenFree = widget.currentFiltres['gluten'];
    _lactoseFree = widget.currentFiltres['lactose'];

    _vegan = widget.currentFiltres['vegan'];
    _vegetarian = widget.currentFiltres['vegetarian'];

    super.initState();
  }

//создаем виджет-каркас для фильтров с переменными
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
        //действие сохранения состояния фильтра, которое потом передается в мейн
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
              'Вы можете изменить свой выбор еды',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          //Создаем переключатели в списке
          Expanded(
            child: ListView(
              children: <Widget>[
                // используем виджеты-каркасы для фильтров
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
