import 'package:activity/models/location.dart';
import 'package:activity/screens/publi_location.dart';

import 'package:flutter/material.dart';

class LocaleCard extends StatelessWidget {
  final Alignment imgAlgn;
  final Location locale;

  const LocaleCard(this.locale, {this.imgAlgn = Alignment.topCenter, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LocationExpand(locale))),
      child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    locale.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(locale.subject)
                ),
              ],
            ),
            constraints: const BoxConstraints( minHeight: 100 ),
          ),
          Container(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.favorite),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.share),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.3)),
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ],
      ),
    );
  }
}