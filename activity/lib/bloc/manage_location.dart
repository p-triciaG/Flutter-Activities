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

class DeleteLocationEvent extends LocationEvent{
  int id;
  DeleteLocationEvent(this.id);
}

class LocationState{
  List<Location> list;
  LocationState(this.list);
}

class ManageLocationBloc extends Bloc<LocationEvent, LocationState>{
  List<Location> list = [];
  ManageLocationBloc():super(LocationState([])){
    LocalDatabase.helper.stream.listen((event) {
      if (event[1] == null) {
        try {
          list.removeWhere((element) => element.id == event[0]);
        } on Exception catch (err) {
          print(err.toString());
        }
      } else {
       list.add(event[1]);
      }
      add(UpdateList(list));
    });

    on<AddLocationEvent>((event, emit) async {
      await LocalDatabase.helper.insertLocale(event.item);
    });

    on<DeleteLocationEvent>((event, emit) async {
      if (!event.id.isNaN){
        await LocalDatabase.helper.deleteLocale(event.id);
      }
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