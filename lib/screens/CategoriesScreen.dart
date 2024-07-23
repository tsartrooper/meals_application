import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/widgets/CategoryWidget.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/screens/MealsScreen.dart';
import 'package:meals_app/screens/Tabs.dart';
import 'package:meals_app/widgets/MainDrawer.dart';




class Categories extends StatelessWidget{

  List<Meal> availableMeals = [];
  final void Function(Meal meal) toggleFavorite;
  final void Function(String screen) setScreen;
  List<Meal> filteredMeals = [];


  Categories({required this.toggleFavorite, required this.setScreen, required this.filteredMeals});

  void _selectedCategory(BuildContext context, Category cat){
    print("goin?");
    availableMeals = filteredMeals
        .where((m) => m.categories.contains(cat.id))
        .toList();


    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => Meals(
            availableMeals:availableMeals,
          category: cat.name,
          toggleFavorite: toggleFavorite,
        )));
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('pick your category')),
      body: GridView(
        padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,),
          children: [
                for(Category cat in availableCategories)
                  CategoryWidget(
                    category: cat,
                    onSelectCategory: (){_selectedCategory(context, cat);},
                  )
          ],
        ),
      drawer: MainDrawer(setScreen: setScreen,),
    );
  }
}
