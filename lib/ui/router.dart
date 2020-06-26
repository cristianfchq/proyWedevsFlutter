import 'package:covid19/ui/views/bottomNavigationInferior.dart';
import 'package:covid19/ui/views/departmentDetails/departmentDetails.dart';
import 'package:covid19/ui/views/product/ModifyProduct.dart';
import 'package:covid19/ui/views/screenNoticias/noticiasDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import './views/product/homeView.dart';
import './views/product/addProduct.dart';
import './views/product/productDetails.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'                   : (BuildContext context) => BottomNavigationInferior(),
    '/departmentDetails'  : (BuildContext context) => DepartmentDetailsPage(departmentRecived: ModalRoute.of(context).settings.arguments),
    '/noticiasDetails'    : (BuildContext context) => NoticiasDetailsPage(noticiasRecived: ModalRoute.of(context).settings.arguments),

    '/addProduct'         : (BuildContext context) => AddProduct(),
    '/productDetails'     : (BuildContext context) => ProductDetails(product: ModalRoute.of(context).settings.arguments),
    '/productModify'      : (BuildContext context) => ModifyProduct(product: ModalRoute.of(context).settings.arguments)
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
