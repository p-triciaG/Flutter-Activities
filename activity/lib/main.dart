import 'package:activity/bloc/manage_location.dart';
import 'package:activity/models/location.dart';
import 'package:activity/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Location> allLocations = [
    Location(title: 'Parque Nacional dos Lagos de Plitvice', subject: 'Lugar bacana', imagePath: 'image/OIP.jpg'),
    Location(title: 'Parque Nacional Banff', description: 'Lugar bacana', imagePath: 'image/PBC.jpg'),
    Location(title: 'Islas Galápagos', description: 'Lugar bacana', imagePath: 'image/IGE.jpg'),
  ];

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(create: (_) => ManageLocationBloc(LocationState(allLocations)))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
