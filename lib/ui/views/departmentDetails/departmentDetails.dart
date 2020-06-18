import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';
import 'package:flutter/material.dart';
import 'package:covid19/core/models/departmentModel/departmentModel.dart';
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
        title:
            Text(widget.departmentRecived.nombre, style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
      ),
      body: Center(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    final departmentProvider = Provider.of<CRUDModelDepartment>(context);
    return Column(
      children: <Widget>[
        Text(widget.departmentRecived.id),
        _getTotalCasosConfirmados(
            departmentProvider, widget.departmentRecived.id),
      ],
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
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                        numberFormat(double.parse(casosDecesos))
                            .split('.')[0],
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
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
}
