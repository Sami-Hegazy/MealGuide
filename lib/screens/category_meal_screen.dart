import 'package:flutter/material.dart';
import 'package:meal_guide/models/meal.dart';
import 'package:meal_guide/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = '/categoryMeals';

  final List<Meal> availableMeals;

  const CategoryMealScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  late List<Meal> displayedMeal;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeal.removeWhere((element) => element.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
            id: displayedMeal[index].id,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
