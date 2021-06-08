import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final void Function(Map<String, bool>) saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lacatoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _lacatoseFree = widget.filters['lactose'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currenValue,
    void Function(bool) updateHandler,
  ) {
    return SwitchListTile(
      value: currenValue,
      onChanged: (val) {
        setState(() {
          updateHandler(val);
        });
      },
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              'gluten': _glutenFree,
              'lactose': _lacatoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            }),
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (val) {
                    _glutenFree = val;
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include gluten-free meals.',
                  _lacatoseFree,
                  (val) {
                    _lacatoseFree = val;
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (val) {
                    _vegetarian = val;
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (val) {
                    _vegan = val;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
