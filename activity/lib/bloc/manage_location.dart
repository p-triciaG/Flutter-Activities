import 'package:activity/models/location.dart';
import 'package:activity/provider/locale_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LocationEvent {}

class AddLocationEvent extends LocationEvent{
  Location item;
  AddLocationEvent(this.item);
}

class FilterLocationEvent extends LocationEvent{
  String search;
  FilterLocationEvent(this.search);
}

class AskNewList extends LocationEvent{}

class UpdateList extends LocationEvent{
  List<Location> list;
  UpdateList(this.list);
}

class LocationState{
  List<Location> list;
  LocationState(this.list);
}

class ManageLocationBloc extends Bloc<LocationEvent, LocationState>{
  List<Location> list = [];
  ManageLocationBloc():super(LocationState([])){
    LocalDatabase.helper.stream.listen((event) {
      print(event[0]);
      list.add(event[1]);
      
      add(UpdateList(list));
    });

    on<AddLocationEvent>((event, emit) async {
      await LocalDatabase.helper.insertLocale(event.item);
    });
    
    on<FilterLocationEvent>((event, emit) {
      List<Location> temp = [];
      for (Location item in list){
        if(item.search(event.search)) temp.add(item);
      }
      add(UpdateList(temp));
    });

    on<AskNewList>((event, emit) async {
      list = await LocalDatabase.helper.getLocales();
      emit(LocationState(list));
    });
    on<UpdateList>((event, emit) async {
      emit(LocationState(event.list));
    });

    add(AskNewList());
  }
}