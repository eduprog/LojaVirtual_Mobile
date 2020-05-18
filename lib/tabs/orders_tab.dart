import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lojavirtual_mobile/screens/login_screen.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';
import 'package:lojavirtual_mobile/services/utils/SignalR.dart';
import 'package:lojavirtual_mobile/store/user.store.dart';
import 'package:lojavirtual_mobile/widgets/order_tile.dart';
import 'package:provider/provider.dart';
import 'package:signalr_client/signalr_client.dart';

class OrdersTab extends StatefulWidget {
  @override
  _OrdersTabState createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  final SignalR signalR = new SignalR();

  // final connectionOptions = HttpConnectionOptions;

  // final hubConnection = HubConnectionBuilder()
  //     .withUrl("http://192.168.0.104:5000/ordersHub",
  //         options: new HttpConnectionOptions(
  //             accessTokenFactory: () async => await Api.getTokenJwt()))
  //     .build();

  @override
  void initState() {
    super.initState();

    signalR.on("ReceiveOrders", onReceiveOrders);
  }

  @override
  void dispose() {
    // método para remover o dispositivo
    stopConnection();

    super.dispose();
  }

  void stopConnection() async {
    await signalR.invoke("RemoveUserGroup");
  }

  void onReceiveOrders(dynamic result) {
    print(result);
  }

  void sendReceiveOrders() async {
    await signalR.invoke("ReceiveOrders");
  }

  @override
  Widget build(BuildContext context) {
    var userStore = Provider.of<UserStore>(context);

    Widget renderOrders() {
      sendReceiveOrders();

      return ListView(
        children: <Widget>[
          OrderTile(),
        ],
      );
    }

    Widget makeLoginForViewOrder() {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.view_list,
              size: 80.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Faça o login para acompanhar!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            )
          ],
        ),
      );
    }

    return Observer(builder: (_) {
      return userStore.isLogged ? renderOrders() : makeLoginForViewOrder();
    });
  }
}
