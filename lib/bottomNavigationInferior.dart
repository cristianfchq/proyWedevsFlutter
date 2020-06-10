import 'package:covid19/graphScreenBolivia.dart';
import 'package:covid19/principalScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// https://pub.dev/packages/font_awesome_flutter
// and added 
// font_awesome_flutter: ^8.8.1 in the puscpec.yaml file

class BottomNavigationInferior extends StatefulWidget {
  @override
  _BottomNavigationInferiorState createState() =>
      _BottomNavigationInferiorState();
}

class _BottomNavigationInferiorState extends State<BottomNavigationInferior> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _widgetOptions = [
    PrincipalScreen(),
    GraphScreenBolivia(),
    ContenedorPeliculas(),
    ContenedorLibros(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _myAppBar(),
      body: _myBody(),
      bottomNavigationBar: _myBottomNavigationBar(),
    );
  }

  Widget _myBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          // icon: Icon(Icons.),
          activeIcon: FaIcon(FontAwesomeIcons.houseUser, size: 30),
          icon: FaIcon(FontAwesomeIcons.home, size: 25),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.apps),
          activeIcon: FaIcon(FontAwesomeIcons.chartArea, size: 30),
          icon: FaIcon(FontAwesomeIcons.chartLine, size: 25),
          title: Text('Estadisticas'),
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.local_movies),
          activeIcon: FaIcon(FontAwesomeIcons.solidNewspaper, size: 30),
          icon: FaIcon(FontAwesomeIcons.newspaper, size: 25),
          title: Text('Noticias'),
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.book),
          activeIcon: FaIcon(FontAwesomeIcons.solidBookmark, size: 30),
          icon: FaIcon(FontAwesomeIcons.bookmark, size: 25),
          title: Text('Libros'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      // selectedIconTheme: IconThemeData(),
      selectedItemColor: _selectedIndex == 2
          ? Colors.red[800]
          : _selectedIndex == 3 ? Colors.indigo[800] : Colors.green[800],
      unselectedItemColor: Colors.black54,
      unselectedLabelStyle:
          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      iconSize: 30.0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      // key: Key("value"),
    );
  }

  Widget _myBody() {
    return Center(
      child: _widgetOptions[_selectedIndex],
    );
  }

  Widget _myAppBar() {
    return AppBar(
      title: Text("BottomNavigationBar"),
    );
  }
}

class ContenedorJuegos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 150,
    );
  }
}

class ContenedorApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 150,
    );
  }
}

class ContenedorPeliculas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      height: 150,
    );
  }
}

class ContenedorLibros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 150,
    );
  }
}
