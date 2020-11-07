import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.setFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten-free'];
    _lactoseFree = widget.currentFilters['lactose-free'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten-free': _glutenFree,
                'lactose-free': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your preferences',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-free'),
                  subtitle: Text(
                    'Only include gluten-free meals.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: _glutenFree,
                  onChanged: (newValue) => setState(() {
                    _glutenFree = newValue;
                  }),
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text(
                    'Only include vegetarian meals.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: _vegetarian,
                  onChanged: (newValue) => setState(() {
                    _vegetarian = newValue;
                  }),
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  subtitle: Text(
                    'Only include lactose-free meals.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: _lactoseFree,
                  onChanged: (newValue) => setState(() {
                    _lactoseFree = newValue;
                  }),
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text(
                    'Only include Vegan meals.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: _vegan,
                  onChanged: (newValue) => setState(() {
                    _vegan = newValue;
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
