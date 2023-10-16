import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      );

  Widget _createSectionContainer({required Widget child}) => Container(
        width: 330,
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(meal.imageUrl), fit: BoxFit.cover)),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    final String ingredient = meal.ingredients[index];
                    return Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(ingredient),
                      ),
                    );
                  }),
            ),
            _createSectionTitle(context, "Passos"),
            _createSectionContainer(
              child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    final String step = meal.steps[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text((index + 1).toString()),
                          ),
                          title: Text(step),
                        ),
                        const Divider()
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
