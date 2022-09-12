import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:meal_app/screens/menu.dart';
import 'filteration.dart';
import 'models/meal.dart';
import 'screens/category_meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoriteMeals = [];
  void toggleFavorite(String mealId){
    final existingIndex = favoriteMeals.indexWhere((meal) =>meal.id == mealId);
    if (existingIndex>=0){
    setState(() {
      favoriteMeals.removeAt(existingIndex);
    });   
    } else{
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isMealFavorite(String id){
    return favoriteMeals.any((meal) => meal.id == id);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        textTheme: ThemeData.dark().textTheme.copyWith(
            titleMedium: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed')),
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/': (context) => Menu(favoriteMeals),
        CategoryMeals.routeName: (context) => CategoryMeals(availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite, isMealFavorite),
        FiltersScreen.routeName: ((context) => FiltersScreen(currentFilters: filters,saveFilters: setFilters))
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoriesScreen());
      },
    );
  }
}
