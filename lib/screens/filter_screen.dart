import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final  Function saveFilters;
  final Map<String , bool>currentFilters;

     FilterScreen(this.currentFilters,this.saveFilters,);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
@override
   initState() {
  _glutenFree = widget.currentFilters['glutten']??false;
  _lactoseFree = widget.currentFilters['lactose']??false;
  _vegan = widget.currentFilters['vegan']??false;
  _vegetarian = widget.currentFilters['vegetarian']??false;

  super.initState();
  }
  // Widget _buildSwitchListTile(String title, String description,
  //     bool currentValue, VoidCallback updateValue) {
  //   return SwitchListTile(
  //     title: Text(title),
  //     value: _glutenFree,
  //     subtitle: Text(description),
  //     onChanged: updateValue,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filter'),
          actions: [
            IconButton(onPressed: () {
              final selectedFilters ={'gluten':_glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian':_vegetarian,
              };
              widget.saveFilters(selectedFilters );}, icon: Icon(Icons.save))
          ],
        ),
        
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Expanded(
                child: ListView(
              children: [
                  SwitchListTile(
                      title: Text('Gluten- free'),
                      value: _glutenFree,
                      subtitle: Text('Only include gluten-free meals'),
                      onChanged: (newValue){
                        setState(() {
                          _glutenFree=newValue;
                        });
    },
                    ),
                SwitchListTile(
                  title: Text('Lactose- free'),
                  value: _lactoseFree,
                  subtitle: Text('Only include lactose-free meals'),
                  onChanged: (newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian- free'),
                  value: _vegetarian,
                  subtitle: Text('Only include vegetarian-free meals'),
                  onChanged: (newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan- free'),
                  value: _vegan,
                  subtitle: Text('Only include Vegan-free meals'),
                  onChanged: (newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
