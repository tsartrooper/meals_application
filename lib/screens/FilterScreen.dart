import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget{

  const FilterScreen();

  Widget build(BuildContext context, WidgetRef ref){
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: SwitchListTile(
                      value: activeFilters[Filter.GlutenFree]!,
                      onChanged: (isChecked){
                          ref.read(filtersProvider.notifier).setFilter(Filter.GlutenFree, isChecked);
                        },
                        title: Text("GlutenFree meals", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        ),),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: SwitchListTile(
                      value: activeFilters[Filter.Vegeterian]!,
                      onChanged: (isChecked){
                        ref.read(filtersProvider.notifier).setFilter(Filter.Vegeterian, isChecked);
                      },
                      title: Text("Vegetarian meals", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary
                      ),),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: SwitchListTile(
                      value: activeFilters[Filter.Vegan]!,
                      onChanged: (isChecked){
                        ref.read(filtersProvider.notifier).setFilter(Filter.Vegan, isChecked);
                      },
                      title: Text("Vegan meals", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary
                      ),),),
                  ),
                ]
            ),
    );
  }
}

