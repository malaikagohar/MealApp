import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  const CategoryMeals(this.availableMeals, {Key? key}) : super(key: key);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryID = routeArgs['id'];
      categoryTitle = routeArgs['title']!;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(categoryTitle as String,
              style: const TextStyle(fontFamily: 'Kaushan_Script', fontSize: 35)),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  id: displayedMeals![index].id,
                  title: displayedMeals![index].title,
                  imageUrl: displayedMeals![index].imageUrl,
                  duration: displayedMeals![index].duration,
                  complexity: displayedMeals![index].complexity,
                  affordability: displayedMeals![index].affordability,
                );
              },
              itemCount: displayedMeals!.length,
            )),
      ),
    );
  }
}
