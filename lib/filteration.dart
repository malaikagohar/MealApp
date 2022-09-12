import 'dummy_data.dart';
import 'models/meal.dart';

Map<String, bool>? filters = {
  'gluten': false,
  'lactose': false,
  'vegan': false,
  'vegetarian': false
};
List<Meal> availableMeals = DUMMY_MEALS;

void setFilters(Map<String, bool> filterData) {
  filters = filterData;
  availableMeals = DUMMY_MEALS.where((meal) {
    if (filters!['gluten'] as bool && !meal.isGlutenFree) {
      return false;
    }
    if (filters!['lactose'] as bool && !meal.isLactoseFree) {
      return false;
    }
    if (filters!['vegan'] as bool && !meal.isVegan) {
      return false;
    }
    if (filters!['vegetarian'] as bool && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
}
