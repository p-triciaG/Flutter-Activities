import 'package:travelovers/bloc/manage_location.dart';
import 'package:travelovers/bloc/manage_user.dart';
import 'package:travelovers/models/location.dart';
import 'package:travelovers/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(create: (_) => ManageLocationBloc()),
        BlocProvider(create: (_) => ManageUserBloc(UserState()))
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
