import 'package:covid19/ui/views/ModifyProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './views/homeView.dart';
import './views/addProduct.dart';
import './views/productDetails.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'               : (BuildContext context) => HomeView(),
    '/addProduct'     : (BuildContext context) => AddProduct(),
    '/productDetails' : (BuildContext context) => ProductDetails(product: ModalRoute.of(context).settings.arguments),
    '/productModify'  : (BuildContext context) => ModifyProduct(product: ModalRoute.of(context).settings.arguments)
  };
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
