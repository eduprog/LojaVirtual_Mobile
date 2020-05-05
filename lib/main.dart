import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/screens/home_screen.dart';
import 'package:lojavirtual_mobile/store/cart.store.dart';
import 'package:lojavirtual_mobile/store/user.store.dart';
import 'package:provider/provider.dart';

// Esta classe permite acesso ao LocalHost com certificados HTTPS inválidos
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(
          value: UserStore(),
        ),
        Provider<CartStore>.value(
          value: CartStore(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter\'s Clothing',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color.fromARGB(255, 4, 125, 141)),
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
