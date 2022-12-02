import 'package:flutter/material.dart';

class Perfil1 extends StatelessWidget {
  const Perfil1({Key? key}) : super(key: key);
  final String pathToKleytonImage = 'image/kleyton.jpg';
  final String kleytonName = "Kleyton Rafael Da Silva Siqueira";
  final String kleyRa = "176803";
  final String kleytonDescription =
      "Gosto de instrumentos musicais e mando bem no violão. E gosto de pão de queijo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              kleytonName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 150,
                    width: 100,
                    child: Image(
                        image: AssetImage(
                          pathToKleytonImage,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          kleyRa,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: Colors.black,
                              overflow: TextOverflow.fade),
                        ),
                      ),
                      Text(
                        kleytonDescription,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
