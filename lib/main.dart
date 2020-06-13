import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import './core/viewmodels/CRUDModel.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Material App',
        theme: ThemeData(),
        routes: getAplicationRoutes(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

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
