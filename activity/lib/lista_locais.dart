import 'package:activity/Component/locale_card.dart';
import 'package:activity/Component/search_input.dart';
import 'package:activity/Model/location.dart';
import 'package:flutter/material.dart';

class ListaLocais extends StatefulWidget{
  const ListaLocais({Key? key}) : super(key: key);

  @override
  State<ListaLocais> createState() => _ListaLocaisState();
}

class _ListaLocaisState extends State<ListaLocais> {
  List<Location> allLocations = [
    Location(title: 'Parque Nacional dos Lagos de Plitvice', subject: 'Lugar bacana', imagePath: 'image/OIP.jpg'),
    Location(title: 'Parque Nacional Banff', description: 'Lugar bacana', imagePath: 'image/PBC.jpg'),
    Location(title: 'Islas Galápagos', description: 'Lugar bacana', imagePath: 'image/IGE.jpg'),
  ];

  final TextEditingController _search = TextEditingController();
  
  late List<Location> filtered;

  _ListaLocaisState(){
    filterList();
  }

  filterList(){
    filtered = [];
    if(_search.text.isEmpty) {
      filtered = allLocations.sublist(0);
    } else{
      for (var element in allLocations) {
        if(element.search(_search.text.toLowerCase())) filtered.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchInput(_search, () {
            setState(() {
              filterList();
            });
          }),
          for (var l in filtered) LocaleCard(l)
        ],
      ),
    );
  }
}
