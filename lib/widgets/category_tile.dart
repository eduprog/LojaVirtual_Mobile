import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/category.model.dart';
import 'package:lojavirtual_mobile/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel _category;

  CategoryTile(this._category);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(_category.icon),
      ),
      title: Text(_category.title),
      trailing: Icon(Icons.keyboard_arrow_right),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(_category)));
      },
    );
  }
}
