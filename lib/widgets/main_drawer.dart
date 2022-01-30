import 'package:flutter/material.dart';
import 'package:meal_guide/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 1,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).colorScheme.secondary,
              child: Text(
                'cooooooool',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildListTile(
              'Meals',
              Icons.restaurant,
              () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            buildListTile(
              'Filters',
              Icons.settings,
              () {
                Navigator.pushReplacementNamed(
                  context,
                  FiltersScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, VoidCallback press) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: press,
    );
  }
}
