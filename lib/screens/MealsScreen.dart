import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


import 'package:meals_app/screens/MealDetailsScreen.dart';
import 'package:meals_app/widgets/Mealtem.dart';
import 'package:meals_app/models/Meal.dart';


class Meals extends StatelessWidget{
  
  final List<Meal> availableMeals;
  final String category;
  final void Function(Meal meal) toggleFavorite;
  
  Meals({required this.category, required this.availableMeals, required this.toggleFavorite(Meal meal)});

  void _selectedMeal(BuildContext context, Meal meal){
    print("am i here?");
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal, toggleFavorite: toggleFavorite,)));
}
  
  Widget build(BuildContext context){
    Widget content = Center(
      child: Column(
        children: [
          Text("Uh ohh nothing sekected", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),),
          const SizedBox(height: 16),
          Text(
            'Try Selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )
          )
        ],
      ),
    );
    if(availableMeals.isNotEmpty){
      content = ListView.builder(
          itemCount: availableMeals.length,
          itemBuilder: (ctx, index) => MealItem(meal: availableMeals[index], selectMeal: (context, meal){_selectedMeal(context, meal);}),
          );
    }
    return Scaffold(
      appBar: AppBar(title: Text(category),),
      body: content,
    );
  }
  
}