import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:activity/router.dart';
import 'package:activity/screens/splash_screen.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter _appRouter = AppRouter();

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
