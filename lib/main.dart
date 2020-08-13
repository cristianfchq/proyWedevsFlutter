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


// example chart

// import 'package:covid19/ui/views/chartEx/saleshomepage.dart';
// import 'package:flutter/material.dart';
 
// void main() => runApp(MyApp());
 
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FireStore chart',
//       theme: ThemeData(
//         primaryColor: Color(0xff54387A),
//       ),
//       home: SalesHomePage(),
//     );
//   }
// }

// import 'package:flutter/material.Dart';
// import 'package:url_launcher/url_launcher.Dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       home: new Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   Home({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => new Scaffold(
//         appBar: new AppBar(
//           title: new Text("View"),
//         ),
//         body: new Center(
//           child: new FlatButton(
//               onPressed: () => launch("tel://21213123123"),
//               child: new Text("Call me")),
//         ),
//       );
// }

// void main() {
//   runApp(
//     new MyApp(),
//   );
// }

