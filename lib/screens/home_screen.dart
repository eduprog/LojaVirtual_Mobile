import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/tabs/home_tab.dart';
import 'package:lojavirtual_mobile/tabs/place_tab.dart';
import 'package:lojavirtual_mobile/tabs/product_tab.dart';
import 'package:lojavirtual_mobile/widgets/cart_button.dart';
import 'package:lojavirtual_mobile/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          floatingActionButton: CartButton(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          floatingActionButton: CartButton(),
          drawer: CustomDrawer(_pageController),
          body: ProductTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlaceTab(),
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }
}
