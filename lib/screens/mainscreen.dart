import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/favorites.dart';
import '../models/meal.dart';
import '../widgets/menu_widget.dart';

class MainScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const MainScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: const MenuWidget(),
              toolbarHeight: 70,
              title: Image.asset(
                "assets/images/logo.jpeg",
                height: 90,
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              bottom: const TabBar(indicatorColor: Colors.amber, tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: 'Favorites',
                )
              ]),
            ),
            body: TabBarView(children: [
              const CategoriesScreen(),
              Favorites(widget.favoriteMeals)
            ]),
          )),
    );
  }
}
