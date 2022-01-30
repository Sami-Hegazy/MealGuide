import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if ((_filters['gluten'])! && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'])! && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'])! && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'])! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouritedMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritedMeals.add(
          dummyMeals.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouritedMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Guide',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber.withOpacity(0.9), //!accent color alternative
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink.shade500,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(
              favouriteMeals: _favouritedMeals,
            ),
        CategoryMealScreen.routName: (context) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFavourite: _toggleFavourite,
              isFavourite: _isMealFavourite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilter: _filters,
              saveFilters: _setFilters,
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CategoriesScreen();
  }
}
