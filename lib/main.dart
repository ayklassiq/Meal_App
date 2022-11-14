import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_detail_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'package:meal_app/widgets/dummy_categories.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Map <String, bool> _filters = {
    'gluten':false,
    'lactose': false,
    'vegan': false,
    'vegetarian':false,
  };
   List<Meal>_availableMeals = DUMMY_MEALS;

   void _setFilters(Map<String, bool> filterData){
     setState(() {
       _filters=filterData;

       _availableMeals = DUMMY_MEALS.where((meal){
       if((_filters['gluten']??false )&& !meal.isGlutenFree){
         return false;
       }
       if((_filters['lactose']??false) && !meal.isLactoseFree){
         return false;
       }
       if((_filters['vegan'] ?? false)&& !meal.isVegan){
         return false;
       }
       if((_filters['vegetarian']?? false) && !meal.isVegetarian){
         return false;
       }
       return true;

       }).toList();

     });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orange,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          subtitle1: const TextStyle(
            fontSize: 20
              ,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      home: const TabScreen(),
      routes: {
        CategoryMealsScreen.routeName:(ctx)=> CategoryMealsScreen(_availableMeals ),
        MealDetailScreen.routeName:(ctx)=> MealDetailScreen(),
        FilterScreen.routeName:(ctx)=> FilterScreen(_filters, _setFilters),
              },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder:  (ctx) =>CategoryMealsScreen(_availableMeals),);
      },
    );
  }
}

