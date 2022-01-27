import 'package:flutter/material.dart';
import 'package:meal_guide/screens/tabs_screen.dart';
import 'package:meal_guide/screens/categories_screen.dart';
import 'package:meal_guide/screens/category_meal_screen.dart';
import 'package:meal_guide/screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Guide',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber, //!accent color alternative
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
        '/': (context) => const TabsScreen(),
        CategoryMealScreen.routName: (context) => const CategoryMealScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
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
