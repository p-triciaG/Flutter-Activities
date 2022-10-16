import 'package:activity/bloc/manage_location.dart';
import 'package:activity/models/location.dart';
import 'package:activity/screens/add_location.dart';
import 'package:activity/edit_perfil.dart';
import 'package:activity/perfil_1.dart';
import 'package:activity/lista_locais.dart';
import 'package:activity/perfil_2.dart';
import 'package:activity/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/User.dart';

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

  // addLocation(Location getNewLocation){
  //   allLocations.add(getNewLocation);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.account_circle),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                icon: Icon(Icons.cloud),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListaLocais(),
            EditPerfil(),
            Perfil1(),
            Perfil2(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddLocation())),
        ),
      )
    );
  }
}
