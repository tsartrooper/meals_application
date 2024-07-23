import 'package:flutter/material.dart';
import 'package:meals_app/screens/FilterScreen.dart';
import 'package:meals_app/screens/Tabs.dart';



class MainDrawer extends StatelessWidget{
  final void Function(String screen) setScreen;

  MainDrawer({required this.setScreen});
  
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                    ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
            child: Row(
              children:[
                Icon(Icons.fastfood, size: 48,),
                Text(
                    "Cooking Up!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary,),),
              ]
            )
          ),
              ListTile(
                title: Text(
                  "meals",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  )
                ),
                trailing: Icon(Icons.restaurant),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Tabs()));
                },
              ),
              ListTile(
                title: Text(
                    "filters",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,)),
                trailing: Icon(Icons.settings),
                onTap: (){
                  Navigator.of(context).pop();
                  setScreen("filters");
                }
              )
              // IconButton(onPressed: (){
              //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FilterScreen()));}, icon: Icon(Icons.settings))
            ]
          )
    );
  }
  
  
}