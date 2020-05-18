import 'package:signalr_client/http_connection_options.dart';
import 'package:signalr_client/hub_connection.dart';
import 'package:signalr_client/hub_connection_builder.dart';

import 'Api.dart';

class SignalR {
  Type connectionOptions;

  HubConnection hubConnection;

  SignalR() {
    connectionOptions = HttpConnectionOptions;

    hubConnection = HubConnectionBuilder()
        .withUrl("http://192.168.0.104:5000/ordersHub",
            options: new HttpConnectionOptions(
                accessTokenFactory: () async => await Api.getTokenJwt()))
        .build();

    hubConnection.onclose((_) {
      print("Conexão perdida");
    });
  }

  Future invoke(String nameFunction) async {
    if (hubConnection.state == HubConnectionState.Disconnected) {
      await hubConnection.start();
    }

    await hubConnection.invoke(nameFunction).catchError((err) {
      print(err);
    });
  }

  void on(String methodName, void Function(dynamic) methodFunction) {
    hubConnection.on(methodName, methodFunction);
  }
}
