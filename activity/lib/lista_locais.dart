import 'package:activity/Component/locale_card.dart';
import 'package:activity/Component/search_input.dart';
import 'package:activity/models/location.dart';
import 'package:flutter/material.dart';

class ListaLocais extends StatefulWidget{
  List<Location> allLocations;
  ListaLocais(this.allLocations,{Key? key}) : super(key: key);

  @override
  State<ListaLocais> createState() => _ListaLocaisState(this.allLocations);
}

class _ListaLocaisState extends State<ListaLocais> {
  List<Location> allLocations;
  //   Location(title: 'Parque Nacional dos Lagos de Plitvice', subject: 'Lugar bacana', imagePath: 'image/OIP.jpg'),
  //   Location(title: 'Parque Nacional Banff', description: 'Lugar bacana', imagePath: 'image/PBC.jpg'),
  //   Location(title: 'Islas Galápagos', description: 'Lugar bacana', imagePath: 'image/IGE.jpg'),
  // ];
  // _ListaLocaisState(this.allLocations);

  final TextEditingController _search = TextEditingController();
  
  late List<Location> filtered;

  _ListaLocaisState(this.allLocations){
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filtered.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading: Text(filtered[index].title)
          //       );
          //     },
              // children: [
              //   SearchInput(_search, () {
              //     setState(() {
              //       filterList();
              //     });
              //   }),
                for (var l in filtered) LocaleCard(l)
              // ],
            // ),
          // ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
 
//   List persons = [];
//   List original = [];
//   TextEditingController txtQuery = new TextEditingController();

//   void loadData() async {
//     String jsonStr = await rootBundle.loadString('assets/persons.json');
//     var json = jsonDecode(jsonStr);
//     persons = json;
//     original = json;
//     setState(() {});
//   }

//   void search(String query) {
//     if (query.isEmpty) {
//       persons = original;
//       setState(() {});
//       return;
//     }

//     query = query.toLowerCase();
//     print(query);
//     List result = [];
//     persons.forEach((p) {
//       var name = p["name"].toString().toLowerCase();
//       if (name.contains(query)) {
//         result.add(p);
//       }
//     });

//     persons = result;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();

//     loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Tutorial"),
//       ),
//       body: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text( "List view search", style: TextStyle(fontWeight: FontWeight.bold)),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: txtQuery,
//                     onChanged: search,
//                     decoration: InputDecoration(
//                         hintText: "Search",
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
//                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                         prefixIcon: Icon(Icons.search),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.clear),
//                           onPressed: () {
//                             txtQuery.text = '';
//                             search(txtQuery.text);
//                           },
//                         ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             _listView(persons)
//           ]),
//     );
//   }
// }

// Widget _listView(persons) {
//   return Expanded(
//     child: ListView.builder(
//         itemCount: persons.length,
//         itemBuilder: (context, index) {
//           var person = persons[index];
//           return ListTile(
//             leading: CircleAvatar(
//               child: Text(person['name'][0]),
//             ),
//             title: Text(person['name']),
//             subtitle: Text("City: " + person['city']),
//           );
//         }),
//   );
// }