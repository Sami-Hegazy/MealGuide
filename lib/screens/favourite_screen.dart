import 'package:flutter/material.dart';
import 'package:meal_guide/models/meal.dart';
import 'package:meal_guide/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouriteScreen({Key? key, required this.favouriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favourite yet - Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            id: favouriteMeals[index].id,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
