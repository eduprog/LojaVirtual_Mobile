import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/store/cart.store.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartProductModel product;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CartTile(this.product, this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartStore>(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              product.product.images[0].image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.product.title,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
                  ),
                  Text(
                    product.size,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "R\$ ${product.product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        color: Theme.of(context).primaryColor,
                        onPressed: product.quantity > 1 ? () async {
                          bool response = await cart.changeQuantityItem(product, false);

                          if (response == true) {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Item removido com sucesso!"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content:
                                    Text("Não foi possível remover um item!"),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        } : null,
                      ),
                      Text(
                        product.quantity.toString(),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          bool response = await cart.changeQuantityItem(product, true);

                          if (response == true) {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Item adicionado com sucesso!"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content:
                                    Text("Não foi possível adicionar mais um item!"),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                      ),
                      FlatButton(
                        child: Text("Remover"),
                        textColor: Colors.grey[500],
                        onPressed: () async {
                          bool response = await cart.removeCartItem(product);

                          if (response == true) {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Item removido com sucesso!"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content:
                                    Text("Não foi possível remover o item!"),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
