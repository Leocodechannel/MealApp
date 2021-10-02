import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_meal/header.dart';
import 'package:ui_meal/meal.dart';
import 'package:ui_meal/meal_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        cardColor: Colors.orangeAccent,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange),
        bottomAppBarColor: Colors.orange,
        appBarTheme: const AppBarTheme(
          color: Colors.orange,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Meals(),
    );
  }
}

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            title: const Text(
              "Resturant",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ],
          ),
          const Header(),
          const MealList(),
          const Meal(
            row: 1,
          ),
          const Meal(row: 2)
        ],
      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: Container(
          color: Colors.white10,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_alert,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.turned_in,
                    color: Colors.white,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
