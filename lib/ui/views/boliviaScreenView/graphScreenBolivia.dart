import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';
import 'package:covid19/core/models/departmentModel/departmentModel.dart';
import 'package:covid19/ui/widgets/departament/departamentCard.dart';

class GraphScreenBolivia extends StatefulWidget {
  @override
  _GraphScreenBoliviaState createState() => _GraphScreenBoliviaState();
}

class _GraphScreenBoliviaState extends State<GraphScreenBolivia> {
  List<Department> department;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: _myBody(),
    );
  }

  Widget _myBody() {
    return Container(
      // height: MediaQuery.of(context).size.height * 50 / 100, //tamanio del contenedor lila
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _firstParteBody(),
            // departamentos
            Container(
              height: 400,
              child: _departmentCardList(),
            ),
            //
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: _titleGraphs(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: _etiquetas(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: _graphics(),
            ),
            
          ],
        ),
      ),
    );
  }

//! Primera parte

  Widget _firstParteBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        color: Color(0xFF503CAA),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: _titulo(),
          ),
          SizedBox(
            height: 25,
          ),
          _infoCases(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _titulo() {
    return SafeArea(
      child: Container(
        child: Text(
          "Estadisticas",
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _button() {
    return Container(
      // height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF7F6FC8),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Mi País',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Color(0xFF503CAA),
                            fontWeight: FontWeight.w500,
                          ),
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Departamentos',
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _days() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(''),
          ),
          _textDays('Total'),
          _textDays('Hoy'),
          _textDays('Ayer'),
          _icono('assets/pngImage/trazo.png'),
        ],
      ),
    );
  }

  Widget _textDays(String texto) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        texto,
        style: GoogleFonts.notoSans(
          textStyle: TextStyle(
            color: texto == 'Total'
                ? Colors.white
                : Color(0xFF7F6FC8), // Color(0xFF7F6FC8)
            fontWeight: FontWeight.bold,
          ),
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _icono(String rutaImg) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 30),
      child: Container(
        height: 20,
        child: Image(
          image: AssetImage(rutaImg),
        ),
      ),
    );
  }

//! informacion de los casos

  Widget _infoCases() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        child: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            // _filaUno(),
            // SizedBox(
            //   height: 20,
            // ),
            // _filaDos(),
            _containerCases(Color(0xFFFFCE47), 'Casos Confirmados'),
            // SizedBox(
            //   height: 20,
            // ),
            // _containerCases(
            //     Color(0xFF54E8FF), 'Sospechosos', cantidadSospechosos),
            SizedBox(
              height: 20,
            ),
            _containerCases(Color(0xFF4DFF5F), 'Recuperados'),
            SizedBox(
              height: 20,
            ),
            _containerCases(Color(0xFFFF4D4D), 'Decesos'),
          ],
        ),
      ),
    );
  }

  Widget _containerCases(Color colorContainer, String titleContainer) {
    final departmentProvider = Provider.of<CRUDModelDepartment>(context);
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorContainer,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              titleContainer,
              style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            titleContainer == 'Casos Confirmados'
                ? _getTotalCasosConfirmados(departmentProvider)
                : titleContainer == 'Recuperados'
                    ? _getTotalCasosRecuperados(departmentProvider)
                    : _getTotalCasosDecesos(departmentProvider),
          ],
        ),
      ),
    );
  }

//! grafico

  Widget _titleGraphs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gráfico',
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

//! marcadores active recovered deaths

  Widget _etiquetas() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(''),
          ),
          _mark(Color(0xFFFFCE47), 'Sospechosos'),
          SizedBox(
            width: 10,
          ),
          _mark(Color(0xFF4DFF5F), 'Recuperados'),
          SizedBox(
            width: 10,
          ),
          _mark(Color(0xFFFF4D4D), 'Decesos'),
        ],
      ),
    );
  }

  Widget _mark(Color color, String texto) {
    return Row(
      children: <Widget>[
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          texto,
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

//! graficos

  Widget _graphics() {
    return Container(
      height: 200,
      child: SvgPicture.asset("assets/svgImage/grafico.svg"),
    );
  }

//! card horizontal de departamentos

  Widget _departmentCardList() {
    List<Department> departamentos;
    final productProvider = Provider.of<CRUDModelDepartment>(context);
    return Container(
      child: StreamBuilder(
        stream: productProvider.fetchProductsAsStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            departamentos = snapshot.data.documents
                .map((doc) => Department.fromMap(doc.data, doc.documentID))
                .toList();
            // print(products[0].price);
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: departamentos.length,
              itemBuilder: (buildContext, index) =>
                  DepartmentCard(departmentDetails: departamentos[index]),
            );
          } else {
            return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF503CAA)),),);
          }
        },
      ),
    );
  }

  //! para los casos confirmados

  StreamBuilder<QuerySnapshot> _getTotalCasosConfirmados(
      CRUDModelDepartment departmentProvider) {
    return StreamBuilder(
      stream: departmentProvider.fetchProductsAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          department = snapshot.data.documents
              .map((doc) => Department.fromMap(doc.data, doc.documentID))
              .toList();
          double a = 0;
          for (int i = 0; i < department.length; i++) {
            a = a + double.parse(department[i].confirmados);
            print(a);
          }

          return Text(
            numberFormat(a).split('.')[0],
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),);
        }
      },
    );
  }

  //! para los casos recuperados

  StreamBuilder<QuerySnapshot> _getTotalCasosRecuperados(
      CRUDModelDepartment departmentProvider) {
    return StreamBuilder(
      stream: departmentProvider.fetchProductsAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          department = snapshot.data.documents
              .map((doc) => Department.fromMap(doc.data, doc.documentID))
              .toList();
          // print(products[0].price);
          double a = 0;
          for (int i = 0; i < department.length; i++) {
            a = a + double.parse(department[i].recuperados);
            print(a);
          }

          return Text(
            numberFormat(a).split('.')[0],
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),);
        }
      },
    );
  }

  //! para los casos decesos

  StreamBuilder<QuerySnapshot> _getTotalCasosDecesos(
      CRUDModelDepartment departmentProvider) {
    return StreamBuilder(
      stream: departmentProvider.fetchProductsAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          department = snapshot.data.documents
              .map((doc) => Department.fromMap(doc.data, doc.documentID))
              .toList();
          // print(products[0].price);
          double a = 0;
          for (int i = 0; i < department.length; i++) {
            a = a + double.parse(department[i].decesos);
            print(a);
          }

          return Text(
            numberFormat(a).split('.')[0],
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),);
        }
      },
    );
  }

  //! para amentar las comas en los numeros

  String numberFormat(double x) {
    List<String> parts = x.toString().split('.');
    RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

    parts[0] = parts[0].replaceAll(re, ',');
    if (parts.length == 1) {
      parts.add('00');
    } 
    else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 2);
    }
    return parts.join('.');
  }
}
