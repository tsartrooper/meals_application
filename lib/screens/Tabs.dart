import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/screens/CategoriesScreen.dart';
import 'package:meals_app/screens/MealsScreen.dart';
import 'package:meals_app/screens/FilterScreen.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';


class Tabs extends ConsumerStatefulWidget{
  ConsumerState<Tabs> createState() => TabsState();
}

class TabsState extends ConsumerState<Tabs>{

  List<Meal> favoriteMeals = [];
  int pageIndex = 0;
  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  toggleFavorite(Meal meal){
    setState(() {
      if(favoriteMeals.contains(meal)){
        favoriteMeals.remove(meal);
        _showInfoMessage("meal is removed from favorites.");
      }
      else{
        favoriteMeals.add(meal);
        _showInfoMessage("meal is added to favorites!");
      }
    });
  }

  _setScreen(String screen) async {
    if(screen == 'filters'){
      Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) => FilterScreen()
          )
      );
    }
  }

  selectPageIndex(int index){
    setState(() {
      pageIndex = index;
    });
  }

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message)),
    );
  }

  Widget build(BuildContext context){

    final dummyMeals = ref.watch(mealsProvider);
    final _selectedFilters = ref.watch(filtersProvider);
    print(_selectedFilters);

    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = Categories(toggleFavorite: toggleFavorite, setScreen: _setScreen, filteredMeals: availableMeals,);

    if(pageIndex == 1){
      activePage = Meals(category: "Favorites", availableMeals: favoriteMeals, toggleFavorite: toggleFavorite);
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites"),
        ],
      ),
    );
  }
}