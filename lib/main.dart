import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(255, 254, 229, 1)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            background: const Color.fromRGBO(255, 254, 229, 1)),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall:
                const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed')),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.home: (context) => const CategoriesScreen(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
      },
    );
  }
}
