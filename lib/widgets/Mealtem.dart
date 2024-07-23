import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/widgets/MealTrait.dart';


class MealItem extends StatelessWidget{

  final Meal meal;
  final void Function(BuildContext context, Meal meal) selectMeal;

  const MealItem({required this.meal, required this.selectMeal});

  Widget build(BuildContext context){
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: (){selectMeal(context, meal);},
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child:Column(
                      children:[
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 12,),
                        Center(
                          child: Row(
                            children: [
                              MealTrait(meal: meal),
                            ],
                          ),
                        )
                        ]
                        )
                )
                )
          ],
        ),
        )
    );
  }



}