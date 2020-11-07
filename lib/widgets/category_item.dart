import 'package:flutter/material.dart';

import '../routes/Meals.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem(this.category);
  _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      Meals.routeName,
      arguments: {
        'id': category.id,
        'title': category.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String title = category.title;
    final Color color = category.color;
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: color,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
