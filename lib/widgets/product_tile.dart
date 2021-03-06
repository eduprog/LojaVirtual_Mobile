import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/product.model.dart';
import 'package:lojavirtual_mobile/screens/product_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductTile extends StatelessWidget {
  final String _type;
  final ProductModel _productModel;

  ProductTile(this._type, this._productModel);

  @override
  Widget build(BuildContext context) {
    Widget _gridTile() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.8,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              autoplay: false,
              dotColor: Theme.of(context).primaryColor,
              images: _productModel.images.map((image) {
                return NetworkImage(image.image);
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    _productModel.title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "R\$ ${_productModel.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget _listTile() {
      return Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 0.8,
              child: Carousel(
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotBgColor: Colors.transparent,
                autoplay: false,
                dotColor: Theme.of(context).primaryColor,
                images: _productModel.images.map((image) {
                  return NetworkImage(image.image);
                }).toList(),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _productModel.title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "R\$ ${_productModel.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductScreen(_productModel)),
        );
      },
      child: Card(
        child: _type == "grid" ? _gridTile() : _listTile(),
      ),
    );
  }
}
