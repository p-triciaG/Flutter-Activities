import 'package:flutter/material.dart';

class Perfil2 extends StatefulWidget {
  const Perfil2({Key? key}) : super(key: key);

  @override
  State<Perfil2> createState() => _Perfil2State();
}

class _Perfil2State extends State<Perfil2> {
  final String pathToPatyImage = 'image/paty.jpg';
  final String patyName = "Patrícia Guimarães";
  final String patyRa = "186451";
  final String patyDescription =
      "Aluna de Análise e Desenvolvimento de Sistemas, gosta de gatinhos e animes";

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
              patyName,
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
                          pathToPatyImage,
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
                          patyRa,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: Colors.black,
                              overflow: TextOverflow.fade),
                        ),
                      ),
                      Text(
                        patyDescription,
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
