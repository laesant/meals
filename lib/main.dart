import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
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
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(
              meals: _availableMeals,
            ),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => const SettingsScreen()
      },
    );
  }
}
