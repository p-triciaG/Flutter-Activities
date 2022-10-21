import 'package:activity/models/User.dart';
import 'package:activity/models/location.dart';
import 'package:activity/provider/locale_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class SignUpEvent extends UserEvent{
  User user;
  SignUpEvent(this.user);
}

class UpdateUserEvent extends UserEvent{
  User user;
  String id;
  UpdateUserEvent(this.id, this.user);
}

class SignInEvent extends UserEvent{
  String email;
  String pwd;

  SignInEvent(this.email, this.pwd);
}

class UserState{}

class UserNotFound extends UserState{}

class UserFound extends UserState{
  String id;
  User user;
  UserFound(this.id, this.user);
}

class ManageUserBloc extends Bloc<UserEvent, UserState>{

  ManageUserBloc(UserState init):super(init){
    on<SignInEvent>((event, emit) async {
      Map? userMap = await LocalDatabase.helper.getUser(event.email, event.pwd);

      if (userMap==null) {
        emit(UserNotFound());
      } else {
        User user = User.fromMap(userMap);
        emit(UserFound(userMap["id"].toString(), user));
      }
    });
    on<SignUpEvent>((event, emit) {
      LocalDatabase.helper.insertUser(event.user);
      emit(UserState());
    });
    on<UpdateUserEvent>(((event, emit) {
      LocalDatabase.helper.updateUser(event.id, event.user);
      emit(UserFound(event.id, event.user));
    }));
  }
}