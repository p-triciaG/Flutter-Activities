import 'package:activity/Model/location.dart';

import 'package:flutter/material.dart';

class LocaleCard extends StatelessWidget {
  final Alignment imgAlgn;
  final Location locale;

  const LocaleCard(this.locale, {this.imgAlgn = Alignment.topCenter, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(locale.imagePath),
              fit: BoxFit.fitWidth,
              alignment: imgAlgn,
            )
          ),
        ),
        ConstrainedBox(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 8)),
              Text(locale.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8)),
              Text(locale.subject),
            ],
          ),
          constraints: const BoxConstraints( minHeight: 100 ),
        ),
        Container(
          child: Row(
            children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  Icon(Icons.favorite),
                ],
              ),

              Row(
                children: const [
                  Icon(Icons.share),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.3)),
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      ],
    );
  }
}