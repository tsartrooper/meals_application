import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/models/Meal.dart';

enum Filter{
  GlutenFree,
  Vegan,
  Vegeterian
}


class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super(
      {
        Filter.GlutenFree: false,
        Filter.Vegeterian: false,
        Filter.Vegan: false
      });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive
    };
  }

  void setFilters(Map<Filter, bool> activeFilters) {
    state = activeFilters;
    print("we here?");
  }
}



  final filteredMealsProvider = Provider((ref){
    final meals = ref.read(mealsProvider);
    final _selectedFilters = ref.watch(filtersProvider);
    final filteredMeals = meals.where((m) {
      if(_selectedFilters[Filter.GlutenFree]! && !m.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.Vegan]! && !m.isVegan){
        return false;
      }
      if(_selectedFilters[Filter.Vegeterian]! && !m.isVegetarian){
        return false;
      }
      return true;
    })
        .toList();
    return filteredMeals;
  });


final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>
  ((ref) => FiltersNotifier());

