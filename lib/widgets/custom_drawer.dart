import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lojavirtual_mobile/screens/login_screen.dart';
import 'package:lojavirtual_mobile/store/user.store.dart';
import 'package:provider/provider.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBackDegrade() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      );

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<UserStore>(context);

    store.readUser();

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBackDegrade(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Flutter's\nClothing",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Observer(builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Olá, ${store.nameUser}",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                store.isLogged
                                    ? "Sair"
                                    : "Entre ou cadastre-se >",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () async {
                                if (store.isLogged) {
                                  store.logout();
                                } else {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
