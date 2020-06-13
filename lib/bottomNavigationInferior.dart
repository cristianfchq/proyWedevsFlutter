
import 'package:covid19/ui/views/bolivia/graphScreenBolivia.dart';
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
    ContenedorNoticias(),
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
          activeIcon: FaIcon(FontAwesomeIcons.houseUser, size: 25),
          icon: FaIcon(FontAwesomeIcons.home, size: 20),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.apps),
          activeIcon: FaIcon(FontAwesomeIcons.chartArea, size: 25),
          icon: FaIcon(FontAwesomeIcons.chartLine, size: 20),
          title: Text('Estadisticas'),
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.local_movies),
          activeIcon: FaIcon(FontAwesomeIcons.solidNewspaper, size: 25),
          icon: FaIcon(FontAwesomeIcons.newspaper, size: 20),
          title: Text('Noticias'),
        ),
        // BottomNavigationBarItem(
        //   // icon: Icon(Icons.book),
        //   activeIcon: FaIcon(FontAwesomeIcons.solidBookmark, size: 30),
        //   icon: FaIcon(FontAwesomeIcons.bookmark, size: 25),
        //   title: Text('Libros'),
        // ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      // selectedIconTheme: IconThemeData(),
      selectedItemColor: _selectedIndex == 0
          ? Color(0xFF947EF9)
          : _selectedIndex == 1
              ? Color(0xFF947EF9)
              : _selectedIndex == 2 ? Color(0xFF947EF9) : Colors.green[800],
      unselectedItemColor: Color(0xFF909090),
      unselectedLabelStyle:
          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      iconSize: 10.0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      // key: Key("value"),
      // backgroundColor: Colors.amber,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    );
  }

  Widget _myBody() {
    return Center(
      child: _widgetOptions[_selectedIndex],
    );
  }
}

class ContenedorNoticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      height: 150,
    );
  }
}
