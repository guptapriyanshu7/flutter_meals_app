import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../routes/meal_detail.dart';

class MealItem extends StatelessWidget {
  final categoryMeal;
  // final removeItem;
  MealItem(
    this.categoryMeal,
    // this.removeItem
  );
  String complexityText(Complexity type) {
    switch (type) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String affordabilityText(Affordability type) {
    switch (type) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetail.routeName,
      arguments: categoryMeal.id,
    );
    // .then((mealId) {
    // if (mealId != null) {
    // removeItem(mealId);
    // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () => _selectMeal(context),
    //   child:
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => _selectMeal(context),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  categoryMeal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    categoryMeal.title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    // softWrap: true,
                    // overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${categoryMeal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 8),
                      Text(complexityText(categoryMeal.complexity)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordabilityText(categoryMeal.affordability)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
