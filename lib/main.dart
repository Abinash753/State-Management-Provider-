import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/provider/auth_provider.dart';
import 'package:provider2/provider/count_provider.dart';
import 'package:provider2/provider/example1_provider.dart';
import 'package:provider2/provider/favourite_provider.dart';
import 'package:provider2/provider/theme_changer_provider.dart';
import 'package:provider2/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.green,
                appBarTheme: const AppBarTheme(color: Colors.pinkAccent),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.purple,
                  primaryColor: Colors.greenAccent,
                  appBarTheme: const AppBarTheme(color: Colors.teal),
                  iconTheme: const IconThemeData(color: Colors.red)),
              home: LoginScreen());
        }));
  }
}
