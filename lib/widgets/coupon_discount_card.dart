import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/coupon.model.dart';
import 'package:lojavirtual_mobile/store/cart.store.dart';
import 'package:provider/provider.dart';

class CouponDiscountCard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  CouponDiscountCard(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartStore>(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        title: Text(
          "Cupom de Desconto",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite seu cupom",
              ),
              initialValue: cart.referenceCoupon,
              onFieldSubmitted: (reference) async {
                CouponModel response = await cart.setCouponCode(reference);

                if (response != null) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Cupom de desconto aplicado com sucesso!"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content:
                          Text("Não foi possível aplicar o cupom de desconto!"),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
