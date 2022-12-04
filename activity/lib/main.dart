import 'package:activity/bloc/manage_location.dart';
import 'package:activity/bloc/manage_user.dart';
import 'package:activity/models/location.dart';
import 'package:activity/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyCNS5hPHxdi8_BZAFiqoYzI-yUnu7htrOU",
    authDomain: "travelovers-cf801.firebaseapp.com",
    projectId: "travelovers-cf801",
    storageBucket: "travelovers-cf801.appspot.com",
    messagingSenderId: "658410797854",
    appId: "1:658410797854:web:ec044000f0d4d2fff5e70f"
  ));
  // await Firebase.initializeApp();
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
        home: const SplashScreen(),
      ),
    );
  }
}
