import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favorites extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const Favorites(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {}
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: widget.favoriteMeals.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.heart_broken_sharp,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No Favorites Yet!',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(
                    id: widget.favoriteMeals[index].id,
                    title: widget.favoriteMeals[index].title,
                    imageUrl: widget.favoriteMeals[index].imageUrl,
                    duration: widget.favoriteMeals[index].duration,
                    complexity: widget.favoriteMeals[index].complexity,
                    affordability: widget.favoriteMeals[index].affordability,
                  );
                },
                itemCount: widget.favoriteMeals.length,
              ));
  }
}
