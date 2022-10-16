import 'package:activity/models/location.dart';
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

class LocationState{
  List<Location> list;
  LocationState(this.list);
}

class ManageLocationBloc extends Bloc<LocationEvent, LocationState>{
  List<Location> list = [];
  ManageLocationBloc(LocationState init):super(init){
    list = init.list;
    on<AddLocationEvent>((event, emit) {
      list.add(event.item);
      emit(LocationState(list));
    });
    on<FilterLocationEvent>((event, emit) {
      List<Location> temp = [];
      for (Location item in list){
        if(item.search(event.search)) temp.add(item);
      }
      emit(LocationState(temp));
    });
  }
}