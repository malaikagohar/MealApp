import 'package:flutter/material.dart';
import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  const CategoryItem(
      {Key? key, required this.id,
      required this.title,
      required this.color,
      required this.image}) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeals.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(13)),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Positioned(
              child: Container(
                height: 50.0,
                width: 325.0,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black87, Colors.black12],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
                left: 10,
                right: 10.0,
                bottom: 10.0,
                child: Row(
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ])
                    ]))
          ],
        ),
      ),
    );
  }
}
