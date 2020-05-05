import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/models/product.model.dart';
import 'package:lojavirtual_mobile/screens/cart_screen.dart';
import 'package:lojavirtual_mobile/store/cart.store.dart';
import 'package:lojavirtual_mobile/store/user.store.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel _productModel;

  ProductScreen(this._productModel);

  @override
  _ProductScreenState createState() => _ProductScreenState(_productModel);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductModel _productModel;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String sizeSelected;

  _ProductScreenState(this._productModel);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<UserStore>(context);
    var cart = Provider.of<CartStore>(context);

    store.readUser();

    handleAddCart() async {
      if (store.isLogged) {
        CartProductModel item = new CartProductModel(
            productId: _productModel.id,
            product: _productModel,
            size: sizeSelected,
            quantity: 1,
            origin: 1);

        bool hasAdded = await cart.addCartItem(item);

        if (hasAdded) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        } else {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Não foi possível adicionar o item no carrinho!"),
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_productModel.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  _productModel.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${_productModel.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Tamanho",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: _productModel.sizes.map((size) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            sizeSelected = size.size;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            border: Border.all(
                                color: sizeSelected == size.size
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey[500],
                                width: 3.0),
                          ),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(size.size),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                    height: 44.0,
                    child: Observer(
                      builder: (_) {
                        return RaisedButton(
                          onPressed:
                              sizeSelected == null ? null : handleAddCart,
                          child: Text(
                            store.isLogged
                                ? "Adicionar ao carrinho"
                                : "Entre para comprar",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        );
                      },
                    )),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _productModel.description,
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
