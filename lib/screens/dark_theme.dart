import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //radio button for theme changer
          RadioListTile<ThemeMode>(
              title: const Text("System Mode Theme"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          //light theme radio button
          RadioListTile(
              title: const Text("Light Mode Screen"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          //dark mode theme radio button
          RadioListTile(
              title: const Text("Dark Mode Screen"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          //icon
          const Icon(Icons.favorite)
        ],
      ),
    );
  }
}
