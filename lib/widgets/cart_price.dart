import 'package:flutter/material.dart';

class CartPrice extends StatelessWidget {
  final VoidCallback handleBuy;

  CartPrice(this.handleBuy);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Resumo do Pedido",
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal"),
                Text("R\$ 81,86"),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Desconto"),
                Text("R\$ 81,86"),
              ],
            ),
            Divider(),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "R\$ 81,86",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            RaisedButton(
              onPressed: handleBuy,
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              child: Text("Finalizar Pedido"),
            )
          ],
        ),
      ),
    );
  }
}
