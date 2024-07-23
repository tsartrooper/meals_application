import 'package:flutter/material.dart';


import 'package:meals_app/models/Category.dart';

class CategoryWidget extends StatelessWidget{

  CategoryWidget({required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  Widget build(BuildContext context){
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: Text(category.name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        )
      ),
    );
  }


}