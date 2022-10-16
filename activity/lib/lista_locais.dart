import 'package:activity/Component/locale_card.dart';
import 'package:activity/Component/search_input.dart';
import 'package:activity/bloc/manage_location.dart';
import 'package:activity/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaLocais extends StatelessWidget {
  const ListaLocais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageLocationBloc, LocationState>(builder: ((context, state) => getLocationList(state.list)));
  }

  ListView getLocationList(List<Location> list){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: ((context, index) {
        return LocaleCard(list[index]);
      }),
    );
  }
}

// class ListaLocais extends StatefulWidget{
//   List<Location> allLocations;
//   ListaLocais(this.allLocations,{Key? key}) : super(key: key);

//   @override
//   State<ListaLocais> createState() => _ListaLocaisState(this.allLocations);
// }

// class _ListaLocaisState extends State<ListaLocais> {
//   // List<Location> allLocations;
//   final TextEditingController _search = TextEditingController();
  
//   // late List<Location> filtered;

//   // _ListaLocaisState(this.allLocations){
//   //   filterList();
//   // }

//   // filterList(){
//   //   filtered = [];
//   //   if(_search.text.isEmpty) {
//   //     filtered = allLocations.sublist(0);
//   //   } else{
//   //     for (var element in allLocations) {
//   //       if(element.search(_search.text.toLowerCase())) filtered.add(element);
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SearchInput(_search, () {
//             // setState(() {
//             //   filterList();
//             // });
//           }),
//           // for (var l in filtered) LocaleCard(l)
//         ],
//       ),
//     );
//   }
// }