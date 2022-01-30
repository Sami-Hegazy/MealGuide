import 'package:flutter/material.dart';
import 'package:meal_guide/models/meal.dart';
import 'package:meal_guide/screens/categories_screen.dart';
import 'package:meal_guide/screens/favourite_screen.dart';
import 'package:meal_guide/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen({Key? key, required this.favouriteMeals}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(favouriteMeals: widget.favouriteMeals),
        'title': 'Your FAvourite',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}



// appBar: AppBar(
//           title: const Text('Meals'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Category',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favourite',
//               ),
//             ],
//           ),
//         ),