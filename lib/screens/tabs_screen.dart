import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Vamos Cozinhar?"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categorias",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favoritos",
              )
            ]),
          ),
          body: const TabBarView(children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ]),
        ));
  }
}
