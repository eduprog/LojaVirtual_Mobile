import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/category.model.dart';
import 'package:lojavirtual_mobile/services/category.service.dart';
import 'package:lojavirtual_mobile/widgets/category_tile.dart';

class ProductTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: CategoryService.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200.0,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        }

        var dividedTiles = ListTile.divideTiles(
          tiles:
              snapshot.data.map((category) => CategoryTile(category)).toList(),
          color: Colors.grey[500],
        ).toList();

        return ListView(children: dividedTiles);
      },
    );
  }
}
