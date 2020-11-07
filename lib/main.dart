import 'package:flutter/material.dart';

import './models/meal.dart';
import './database/dummy_data.dart';
import './routes/tabs.dart';
import './routes/meals.dart';
import './routes/meal_detail.dart';
import './routes/filters.dart';

void main() => runApp(DailyMeals());

class DailyMeals extends StatefulWidget {
  @override
  _DailyMealsState createState() => _DailyMealsState();
}

class _DailyMealsState extends State<DailyMeals> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegan': false,
    'vegetarian': false,
  };
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten-free'] && !meal.isGlutenFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['lactose-free'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isFav(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'PlayfairDisplay',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Tabs(_favoriteMeals),
        Meals.routeName: (ctx) => Meals(_availableMeals),
        MealDetail.routeName: (ctx) => MealDetail(_toggleFavorite, _isFav),
        Filters.routeName: (ctx) => Filters(_filters, _setFilters),
      },
    );
  }
}
