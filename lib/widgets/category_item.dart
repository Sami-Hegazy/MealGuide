import 'package:flutter/material.dart';
import 'package:meal_guide/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imgUrl;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
    required this.imgUrl,
  }) : super(key: key);

  void _selectCategory(context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(13),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 17),
              blurRadius: 20,
              color: color,
              spreadRadius: -10,
            ),
          ],
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
