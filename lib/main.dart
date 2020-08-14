import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';

import 'package:covid19/core/viewmodels/CRUDModelProduct.dart';
import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';
import 'package:covid19/core/viewmodels/CRUDModelNoticias.dart';
import 'package:covid19/core/viewmodels/CRUDModelLaboratorio.dart';

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
        ChangeNotifierProvider(create: (_) => locator<CRUDModelLaboratorio>()),
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

// /////////////////////////////////////////////

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'URL Launcher',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'URL Launcher'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<void> _launched;
//   String _phone = '';

//   Future<void> _launchInBrowser(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//         headers: <String, String>{'my_header_key': 'my_header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return const Text('');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const String toLaunch = 'https://maps.app.goo.gl/fGB6HcnN3fqGysqY6';
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(toLaunch),
//               ),
//               RaisedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInBrowser(toLaunch);
//                 }),
//                 child: const Text('Launch in browser'),
//               ),
//               FutureBuilder<void>(future: _launched, builder: _launchStatus),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
