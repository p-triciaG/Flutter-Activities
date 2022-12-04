import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String logoPath = "image/travel_lovers_logo.jpg";

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () {
          Navigator.pop(context);
          Navigator.pushNamed(context, "/login");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image(
                  image: AssetImage(
                    logoPath,
                  ),
                  fit: BoxFit.cover),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "TraveLovers",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
