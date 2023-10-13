import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  void _selectCategory(BuildContext context) => Navigator.of(context)
      .pushNamed(AppRoutes.categoriesMeals, arguments: category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  category.color.withOpacity(0.5),
                  category.color,
                ])),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
