import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphScreenBolivia extends StatefulWidget {
  @override
  _GraphScreenBoliviaState createState() => _GraphScreenBoliviaState();
}

class _GraphScreenBoliviaState extends State<GraphScreenBolivia> {
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
      // height: MediaQuery.of(context).size.height * 25 / 100,
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
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: _button(),
          ),
          SizedBox(
            height: 30,
          ),
          _days(),
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
        child: Column(
          children: <Widget>[
            _filaUno(),
            SizedBox(
              height: 20,
            ),
            _filaDos(),
          ],
        ),
      ),
    );
  }

  Widget _filaUno() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _containerCases(Color(0xFF54E8FF), 'Total Casos', '2,143,703'),
        ),
        SizedBox(
          width: 13,
        ),
        Expanded(
          child: _containerCases(Color(0xFFFFCE47), 'Sospechosos', '1,460,404'),
        ),
      ],
    );
  }

  Widget _filaDos() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _containerCases(Color(0xFF4DFF5F), 'Recuperados', '540,041'),
        ),
        SizedBox(
          width: 13,
        ),
        Expanded(
          child: _containerCases(Color(0xFFFF4D4D), 'Decesos', '143,258'),
        ),
      ],
    );
  }

  Widget _containerCases(
      Color colorContainer, String titleContainer, String numberCases) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorContainer,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Text(
              numberCases,
              style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
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
          Expanded(child: Text(''),),
          _mark(Color(0xFFFFCE47), 'Sospechosos'),
          SizedBox(width: 10,),
          _mark(Color(0xFF4DFF5F), 'Recuperados'),
          SizedBox(width: 10,),
          _mark(Color(0xFFFF4D4D), 'Decesos'),
        ],
      ),
    );
  }

  Widget _mark(Color color, String texto){
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
        Text(texto, style: GoogleFonts.notoSans(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),),
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
