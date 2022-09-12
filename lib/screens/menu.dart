import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../filteration.dart';
import '../models/meal.dart';
import 'filters.dart';
import 'mainscreen.dart';
import 'menu_screen.dart';

class Menu extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const Menu(this.favoriteMeals, {Key? key}) : super(key: key);
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ItemMenu currentItem = MenuItems.meals;

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.filters:
        return FiltersScreen(currentFilters: filters, saveFilters: setFilters);
      case MenuItems.meals:
        return MainScreen(widget.favoriteMeals);
      default:
        return MainScreen(widget.favoriteMeals);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZoomDrawer(
        dragOffset: 10,
        borderRadius: 50,
        angle: 0,
        slideWidth: MediaQuery.of(context).size.width * 0.7,
        showShadow: true,
        menuBackgroundColor: Colors.amber,
        drawerShadowsBackgroundColor: Colors.black54,
        menuScreen: Builder(builder: (context) {
          return MenuScreen(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() {
                  currentItem = item;
                  ZoomDrawer.of(context)!.close();
                });
              });
        }),
        mainScreen: getScreen(),
      ),
    );
  }
}
