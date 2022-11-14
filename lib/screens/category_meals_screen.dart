import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_items.dart';

class CategoryMealsScreen extends StatefulWidget{
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
     String? categoryTitle;
    late List<Meal> displayedMeals;
  var _loadedInitData =false;

  void  _removeMeal(String mealId){
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id==mealId);
      });
  }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
       categoryTitle = routeArgs
      ['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals
          .where(
            (meal) => meal.categories.contains(categoryId),
      )
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
   }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            complexity: displayedMeals[index].complexity,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
