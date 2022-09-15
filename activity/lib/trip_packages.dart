import 'package:flutter/material.dart';

class TripPackages extends StatefulWidget {
  const TripPackages({Key? key}) : super(key: key);

  @override
  State<TripPackages> createState() => _TripPackagesState();
}

class _TripPackagesState extends State<TripPackages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Pacotes de viagem"),
    );
  }
}
