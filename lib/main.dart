import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';

import 'package:covid19/core/viewmodels/CRUDModelProduct.dart';
import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';
import 'package:covid19/core/viewmodels/CRUDModelNoticias.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModelProduct>()),
        ChangeNotifierProvider(create: (_) => locator<CRUDModelDepartment>()),
        ChangeNotifierProvider(create: (_) => locator<CRUDModelNoticias>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Info-Covid',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: getAplicationRoutes(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
/////
// import 'package:flutter/material.dart';
// import 'package:covid19/bottomNavigationInferior.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       debugShowCheckedModeBanner: false,
//       home: BottomNavigationInferior(),
//     );
//   }
// }

