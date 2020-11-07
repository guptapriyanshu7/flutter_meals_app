import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Meals extends StatefulWidget {
  static const routeName = '/meals';

  final List<Meal> availableMeals;
  Meals(this.availableMeals);
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  String categoryTitle;
  List<Meal> categoryMeals;
  // var _loadedInitData = false;
  @override
  void didChangeDependencies() {
    // if (!_loadedInitData) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    // _loadedInitData = true;
    // }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     categoryMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index], 
          // _removeMeal
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
