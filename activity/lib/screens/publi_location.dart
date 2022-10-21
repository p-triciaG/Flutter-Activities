import 'package:activity/models/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocationExpand extends StatelessWidget {
  final Location item;
  const LocationExpand(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(item.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(item.subject),
            ),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}