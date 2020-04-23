import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/category.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:lojavirtual_mobile/services/utils/response.api.model.dart';
import 'package:lojavirtual_mobile/widgets/category_tile.dart';

class ProductTab extends StatelessWidget {
  Future<List<CategoryModel>> getCategories() async {
    http.Response response =
        await http.get("https://192.168.0.104:5001/api/category");

    ResponseApi jsonResponse =
        ResponseApi.fromJson(convert.jsonDecode(response.body));

    if (jsonResponse.success == true) {
      return (jsonResponse.data)
          .map((banners) => CategoryModel.fromJson(banners))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200.0,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
