import 'package:flutter/material.dart';
import 'package:meal_guide/widgets/category_item.dart';
import 'package:meal_guide/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(14),
      children: dummyCategories.map((value) {
        return CategoryItem(
          id: value.id,
          title: value.title,
          color: value.color,
          imgUrl: '',
        );
      }).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2.3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
