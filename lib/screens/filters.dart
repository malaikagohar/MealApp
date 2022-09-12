import 'package:flutter/material.dart';
import '../widgets/menu_widget.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function(Map<String, bool> selectedFilters)? saveFilters;
  final Map<String, bool>? currentFilters;

  const FiltersScreen({Key? key, this.currentFilters, this.saveFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters!['gluten']!;
    _vegetarian = widget.currentFilters!['vegetarian']!;
    _vegan = widget.currentFilters!['vegan']!;
    _lactoseFree = widget.currentFilters!['lactose']!;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      // ignore: avoid_types_as_parameter_names, use_function_type_syntax_for_parameters
      bool currentValue, void updateValue(bool)) {
    return SwitchListTile(
        activeColor: Colors.amber,
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters!(selectedFilters);
                },
                icon: const Icon(Icons.filter_list_sharp))
          ],
          leading: const MenuWidget(),
          toolbarHeight: 70,
          title: Image.asset(
            "assets/images/logo.jpeg",
            height: 90,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Text('Adjust Your Meal Selection',
                    style: Theme.of(context).textTheme.titleMedium)),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-Free',
                    'Only includes Gluten-Free meals.',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegetarian',
                    'Only includes Vegetarian meals.', _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only includes Vegan meals.', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free',
                    'Only includes Lactose-Free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Please tap the save icon on the top right corner to save the filters.',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'RobotoCondensed',
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    )),
              ],
            ))
          ],
        ));
  }
}
