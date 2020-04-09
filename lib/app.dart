import 'package:flutter/material.dart';
import 'package:tridimensional_drawer/tridimensional_drawer.dart';

import 'main_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final TridimensionalDrawerController controller =
      TridimensionalDrawerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TridimensionalDrawer(
      drawer: Opacity(
        opacity: 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
      ),
      mainPage: MainPage(controller),
      backgroundPage: Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/NewYork.jpg',
            fit: BoxFit.cover,
          )),
      controller: controller,
    );
  }
}
