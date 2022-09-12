import 'package:flutter/material.dart';

class ItemMenu {
  final String title;
  final IconData icon;

  const ItemMenu({required this.icon, required this.title});
}

class MenuItems {
  static const meals =
      ItemMenu(icon: Icons.restaurant_outlined, title: 'Meals');
  static const filters = ItemMenu(icon: Icons.settings, title: 'FIlters');

  static const all = <ItemMenu>[
    meals,
    filters,
  ];
}

class MenuScreen extends StatelessWidget {
  final ItemMenu currentItem;
  final ValueChanged<ItemMenu> onSelectedItem;

  const MenuScreen({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget buildMenuItem(ItemMenu item) => ListTile(
          selectedTileColor: Colors.white70,
          selectedColor: Colors.white,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(
            item.icon,
            color: Colors.black,
          ),
          title: Text(
            item.title,
            style: const TextStyle(color: Colors.black),
          ),
          onTap: () => onSelectedItem(item),
        );

    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontFamily: 'Kaushan_Script',
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          ...MenuItems.all.map(buildMenuItem).toList(),
          const Spacer(
            flex: 3,
          )
        ],
      )),
    );
  }
}
