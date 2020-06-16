import 'package:flutter/material.dart';
import 'package:covid19/core/models/departmentModel/departmentModel.dart';

class DepartmentCard extends StatelessWidget {
  final Department departmentDetails;

  DepartmentCard({@required this.departmentDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
        // Navigator.pushNamed(context, '/productDetails');
        // Navigator.pushNamed(context, "/productDetails",
        //     arguments: departmentDetails);
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: departmentDetails.id,
                  child: Image.asset(
                    'assets/pngImage/clean.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        departmentDetails.nombre,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        departmentDetails.confirmados,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
