import 'package:activity/Model/location.dart';
import 'package:activity/add_location.dart';
import 'package:activity/add_location_route.dart';
import 'package:activity/perfil_1.dart';
import 'package:activity/lista_locais.dart';
import 'package:flutter/material.dart';

class ActivityTabBar extends StatefulWidget {
  const ActivityTabBar({Key? key}) : super(key: key);

  @override
  State<ActivityTabBar> createState() => _ActivityTabBarState();
}

class _ActivityTabBarState extends State<ActivityTabBar> {
  List<Location> allLocations = [
    Location(title: 'Parque Nacional dos Lagos de Plitvice', subject: 'Lugar bacana', imagePath: 'image/OIP.jpg'),
    Location(title: 'Parque Nacional Banff', description: 'Lugar bacana', imagePath: 'image/PBC.jpg'),
    Location(title: 'Islas Galápagos', description: 'Lugar bacana', imagePath: 'image/IGE.jpg'),
  ];

  addLocation(Location getNewLocation){
    allLocations.add(getNewLocation);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Atividade 2'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Center(
              child: Perfil1(),
            ),
            // AddLocation((Location getNewLocation){ print("batata"); }),
            Perfil1(),
            ListaLocais(allLocations),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddLocation(addLocation))),
        ),
      ),
    );
  }
}
