import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/category.model.dart';
import 'package:lojavirtual_mobile/models/product.model.dart';
import 'package:lojavirtual_mobile/services/category.service.dart';
import 'package:lojavirtual_mobile/widgets/cart_button.dart';
import 'package:lojavirtual_mobile/widgets/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel _categoryModel;

  CategoryScreen(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButton: CartButton(),
          appBar: AppBar(
            title: Text(_categoryModel.title),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                ),
              ],
            ),
          ),
          body: FutureBuilder<List<ProductModel>>(
            future: CategoryService.getProducts(_categoryModel.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                );
              }

              if (snapshot.data.length == 0) {
                return Center(
                  child: Text("Nenhum produto encontrado!"),
                );
              }

              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  GridView.builder(
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      return ProductTile("grid", snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ProductTile("list", snapshot.data[index]);
                    },
                  ),
                ],
              );
            },
          )),
    );
  }
}
