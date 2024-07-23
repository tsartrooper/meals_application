import 'package:flutter/material.dart';

import 'package:meals_app/models/Meal.dart';





class MealTrait extends StatelessWidget{

  final Meal meal;

  const MealTrait({required this.meal});
  
  
  String mealComplexity(Meal meal){
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }

  String mealAfforadability(Meal mea){
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  Widget build(BuildContext context){
    return Center(
        child:Row(
      children: [
        Icon(Icons.watch_later_outlined),
        SizedBox(width: 2,),
        Text(meal.duration.toString()+" mins", style: TextStyle(color: Colors.white),),
        SizedBox(width: 15,),
        Icon(Icons.work),
        SizedBox(width: 2,),
        Text(mealComplexity(meal), style: TextStyle(color: Colors.white),),
        SizedBox(width: 15,),
        Icon(Icons.attach_money_rounded),
        SizedBox(width: 2,),
        Text(mealAfforadability(meal), style: TextStyle(color: Colors.white),)
      ],
        )
    );
  }


}