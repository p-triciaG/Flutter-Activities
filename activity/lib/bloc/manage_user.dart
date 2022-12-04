import 'package:activity/models/UserModel.dart';
import 'package:activity/provider/firebase_auth.dart';
import 'package:activity/provider/firestore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {
  UserModel? user;
  UserEvent(this.user);
}

class SignUpEvent extends UserEvent{
  SignUpEvent(UserModel user):super(user);
}

class UpdateUserEvent extends UserEvent{
  String id;
  UpdateUserEvent(this.id, UserModel user):super(user);
}

class SignInEvent extends UserEvent{
  String email;
  String senha;
  SignInEvent(this.email, this.senha,{UserModel? user}):super(user);
}

class UserState{}

class UserNotFound extends UserState{}

class UserFound extends UserState{
  String id;
  UserModel user;
  UserFound(this.id, this.user);
}

class UserError extends UserState{
  String error;

  UserError(this.error);
}

class ManageUserBloc extends Bloc<UserEvent, UserState>{
  FirebaseAuthenticationService fb_auth = 
      FirebaseAuthenticationService();

  ManageUserBloc(UserState init):super(init){
    on<SignInEvent>((event, emit) async {
      try {
        User? userMap = await fb_auth.signInWithEmailAndPassword(event.email, event.senha);
      if (userMap==null) {
        emit(UserError("Não foi possível receber os dados!"));
      } else {
        UserModel user = await FirestoreDatabase.helper.getUser(userMap.uid);
        emit(UserFound(userMap.uid, user));
      }
      } catch (e) {
        emit(UserError("Não foi possível logar: ${e.toString()}"));
      }
    });
    on<SignUpEvent>((event, emit) async {
      try {
        User? userMap = await fb_auth.createUserWithEmailAndPassword(event.user!.email, event.user!.senha);

        if (userMap==null) {
          emit(UserError("Não foi possível receber os dados!"));
        } else {
          await FirestoreDatabase.helper.setUser(userMap.uid, event.user!);
          emit(UserState());
        }
      } catch (e) {
        emit(UserError("Não foi possível registrar: ${e.toString()}"));
      }
    });
    on<UpdateUserEvent>(((event, emit) async {
      await FirestoreDatabase.helper.setUser(event.id, event.user!);
      emit(UserFound(event.id, event.user!));
    }));
  }
}