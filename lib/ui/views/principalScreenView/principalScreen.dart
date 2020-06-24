import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
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
            // _firstParteBody(),
            // _firstParteBody(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
              child: _subtitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: _containerPrevention(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: _test(),
            ),
          ],
        ),
      ),
    );
  }

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
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 20),
            child: _resumeImageSVG(),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }

  Widget _titulo() {
    return SafeArea(
      child: Container(
        child: Text(
          "Covid - 19",
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // ),
      ),
    );
  }

  Widget _resumeImageSVG() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _sintomas(),
        _imageSVG(),
      ],
    );
  }

  Widget _imageSVG() {
    return Container(
      width: MediaQuery.of(context).size.width * 35 / 100,
      height: MediaQuery.of(context).size.width * 35 / 100,
      child: SvgPicture.asset("assets/svgImage/symptoms.svg"),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0xFFFFB306),
      ),
    );
  }

  Widget _sintomas() {
    return Container(
      width: MediaQuery.of(context).size.width -
          MediaQuery.of(context).size.width * 35 / 100 -
          50 -
          5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Sintomas",
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "La gente puede estar enferma con el virus de 1 a 14 días antes de desarrollar síntomas",
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return Row(
      children: <Widget>[
        Text(
          'Prevención',
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _containerPrevention() {
    return Container(
      // color: Colors.yellow,
      // height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _prevention1(),
          _prevention2(),
        ],
      ),
    );
  }

  Widget _prevention2() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _imagePrevention('assets/pngImage/cover.png',
              'Cubrirce la boca al toser o esturnudar'),
          _imagePrevention('assets/pngImage/mask.png', 'Usar barbijo'),
          _imagePrevention(
              'assets/pngImage/clean.png', 'Limpiar y desinfectar'),
        ],
      ),
    );
  }

  Widget _prevention1() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _imagePrevention('assets/pngImage/home.png', 'Quedate en casa'),
          _imagePrevention(
              'assets/pngImage/distance.png', 'Mantener distancia'),
          _imagePrevention(
              'assets/pngImage/wash.png', 'Lavate las manos frecuentemente'),
        ],
      ),
    );
  }

  Widget _imagePrevention(String rutaImg, String name) {
    return Expanded(
          child: Container(
          // width: 50,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(rutaImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        
      ),
    );
  }

  Widget _test() {
    return Container(
      // color: Colors.yellow,
      // height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFFFB306),
      ),
      child: Row(
        children: <Widget>[
          _textOfTest(),
          _imageSVGdoctor(),
        ],
      ),
    );
  }

  Widget _imageSVGdoctor() {
    return Container(
      height: 150,
      width: 100,
      child: SvgPicture.asset("assets/svgImage/doctor.svg"),
    );
  }

  Widget _textOfTest() {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Test Covid-19',
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                      color: Color(0xFF3B3858)),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hay pruebas de laboratorio que pueden identificar el virus que causa COVID-19 en muestras respiratorias.',
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Color(0xFF3B3858),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // RaisedButton(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Text(
              //     "Test Ahora",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   elevation: 10,
              //   padding: EdgeInsets.all(9),
              //   color: Color(0xFF503CAA),
              //   onPressed: () {},
              // ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
