import 'package:flutter/material.dart';
import 'package:meal_guide/dummy_data.dart';
import 'package:meal_guide/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routName = '/categoryMeals';

  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text(categoryTitle!, style: const TextStyle(color: Colors.black45)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
            id: categoryMeal[index].id,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
