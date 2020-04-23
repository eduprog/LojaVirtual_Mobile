import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/tabs/home_tab.dart';
import 'package:lojavirtual_mobile/tabs/product_tab.dart';
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
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductTab(),
        ),
        Container(
          color: Colors.purple,
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }
}
