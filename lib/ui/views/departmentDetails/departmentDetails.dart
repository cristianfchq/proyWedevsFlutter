import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';
import 'package:flutter/material.dart';
import 'package:covid19/core/models/departmentModel/departmentModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepartmentDetailsPage extends StatefulWidget {
  final Department departmentRecived;

  DepartmentDetailsPage({@required this.departmentRecived});

  @override
  _DepartmentDetailsPageState createState() => _DepartmentDetailsPageState();
}

class _DepartmentDetailsPageState extends State<DepartmentDetailsPage> {
  List<Department> department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.departmentRecived.nombre,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Text(widget.departmentRecived.id),
            // Hero(
            //   tag: widget.departmentRecived.id,
            //   child: Container(
            //     height: 150,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: NetworkImage(
            //           widget.departmentRecived.img,
            //         ),
            //         fit: BoxFit.contain,
            //       ),
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            // ),
            Hero(
            tag: widget.departmentRecived.id,
            child: CachedNetworkImage(
              imageUrl: widget.departmentRecived.img,
              placeholder: (context, url) => Container(
                height: 250,
                child: Image.asset(
                  'assets/jar-loading.gif',
                  fit: BoxFit.cover,
                ),
              ),
              fadeInDuration: Duration(
                milliseconds: 200,
              ),
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: _firstParteBody(),
            ),
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
    final departmentProvider = Provider.of<CRUDModelDepartment>(context);
    return Container(
      // height: MediaQuery.of(context).size.height * 25 / 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        color: Color(0xFF503CAA),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: _getTotalCasosConfirmados(
                departmentProvider, widget.departmentRecived.id),
          ),
          // SizedBox(
          //   height: 35,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 30, right: 30),
          //   child: _button(),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          // _days(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  //! para los casos confirmados

  StreamBuilder<QuerySnapshot> _getTotalCasosConfirmados(
      CRUDModelDepartment departmentProvider, String idDepartmentRecived) {
    return StreamBuilder(
      stream: departmentProvider.fetchProductsAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          department = snapshot.data.documents
              .map((doc) => Department.fromMap(doc.data, doc.documentID))
              .toList();
          String casosConfirmados;
          String casosRecuperados;
          String casosDecesos;
          for (int i = 0; i < department.length; i++) {
            if (idDepartmentRecived == department[i].id) {
              casosConfirmados = department[i].confirmados;
              casosRecuperados = department[i].recuperados;
              casosDecesos = department[i].decesos;
            }
            print("Casos Confirmados");
            print(casosConfirmados);
            print("Casos Recuperados");
            print(casosConfirmados);
            print("Casos Decesos");
            print(casosConfirmados);
          }

          return Column(
            children: <Widget>[
              //! Contenedor de casos confirmados
              Container(
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFFCE47),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 13, right: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Casos Confirmados',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Text(
                        numberFormat(double.parse(casosConfirmados))
                            .split('.')[0],
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //! contenedor casos recuperados
              Container(
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF4DFF5F),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 13, right: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Recuperados',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Text(
                        numberFormat(double.parse(casosRecuperados))
                            .split('.')[0],
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //! Contenedor casos decesos
              Container(
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFF4D4D),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 13, right: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Decesos',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Text(
                        numberFormat(double.parse(casosDecesos)).split('.')[0],
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text('fetching');
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
    } else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 2);
    }
    return parts.join('.');
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

}
