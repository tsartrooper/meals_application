import 'package:flutter/material.dart';

import 'package:meals_app/models/Meal.dart';
import 'package:transparent_image/transparent_image.dart';



class MealDetails extends StatelessWidget{
  
  final Meal meal;
  final void Function(Meal meal) toggleFavorite;
  
  const MealDetails({
    required this.meal,
    required this.toggleFavorite});
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
      actions:[
        IconButton(
            onPressed: (){toggleFavorite(meal);},
            icon: Icon(Icons.star))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: 500,
            ),
            Text("ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            ),
            for(String ingredient in meal.ingredients)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              ),
            SizedBox(height: 10,),
            Text("steps",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            ),
            ),
            for(String step in meal.steps)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10,),


          ],
        ),
      ),
    );
  }
  
  
}