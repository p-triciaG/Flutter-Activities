import 'package:flutter/material.dart';

class OurTeam extends StatelessWidget {
  const OurTeam({Key? key}) : super(key: key);
  final String pathToKleytonImage = 'assets/kleyton.jpg';
  final String pathToPatyImage = 'assets/paty.jpg';
  final String kleytonName = "Kleyton Rafael Da Silva Siqueira";
  final String patyName = "Patrícia Guimarães";
  final String kleytonDescription =
      "Gosto de instrumentos musicais e mando bem no violão. E gosto de pão de queijo";
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
              "Nosso Time",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          buildTeamMemberImage(
              pathToKleytonImage, kleytonName, kleytonDescription),
          buildTeamMemberImage(pathToPatyImage, patyName, patyDescription),
        ],
      ),
    );
  }

  buildTeamMemberImage(String imagePath, String name, String description) {
    return Container(
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
                    imagePath,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Colors.black,
                        overflow: TextOverflow.fade),
                  ),
                ),
                Text(
                  description,
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
    );
  }
}
