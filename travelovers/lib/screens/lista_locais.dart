import 'package:travelovers/Component/locale_card.dart';
import 'package:travelovers/Component/search_input.dart';
import 'package:travelovers/bloc/manage_location.dart';
import 'package:travelovers/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaLocais extends StatelessWidget {
  final TextEditingController _search = TextEditingController();
  ListaLocais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(_search, (){
          ManageLocationBloc filterEv = BlocProvider.of<ManageLocationBloc>(context);
          filterEv.add(FilterLocationEvent(_search.text));
        }),
        Expanded(
          child: BlocBuilder<ManageLocationBloc, LocationState>(builder: ((context, state) => getLocationList(state.list))),
        ),
      ],
    );
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