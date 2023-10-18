import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(
      {super.key, required this.onSettingsChanged, required this.settings});
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    settings = widget.settings;
    super.initState();
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) =>
      SwitchListTile.adaptive(
          title: Text(title),
          subtitle: Text(subtitle),
          value: value,
          onChanged: (value) {
            onChanged(value);
            widget.onSettingsChanged(settings);
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Filtros",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                    "Sem Glutén",
                    "So exibe refeições sem glutén!",
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    "Sem Lactose",
                    "So exibe refeições sem lactose!",
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    "Vegana",
                    "So exibe refeições veganas!",
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value)),
                _createSwitch(
                    "Vegetariana",
                    "So exibe refeições vegetarianas!",
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value)),
              ],
            ))
          ],
        ));
  }
}
