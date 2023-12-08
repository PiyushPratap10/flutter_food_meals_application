import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritesMealNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealNotifier() : super([]);

  bool mealToggleFavourite(Meal meal) {
    final mealExisting = state.contains(meal);
    if (mealExisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesMealProvider =
    StateNotifierProvider<FavouritesMealNotifier, List<Meal>>((ref) {
  return FavouritesMealNotifier();
});
