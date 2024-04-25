import 'package:paakshaala/Recipe/recipe_api.dart';
import 'package:paakshaala/fridge/items.dart';

List<String> categories = [
  "Frozens",
  "Dairy",
  "Fruits",
  "Vegetables",
  "Cooked Food",
  "Other Groceries"
];

Map<String, List<items>> catitems = {
  "Frozens": [],
  "Dairy": [],
  "Fruits": [],
  "Vegetables": [],
  "Cooked Food": [],
  "Other Groceries": []
};
List<Recipe> randomRecipe = [];

List<Recipe> searchedRecipe = [];
