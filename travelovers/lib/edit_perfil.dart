import 'package:travelovers/bloc/manage_user.dart';
import 'package:travelovers/models/User.dart';
import 'package:flutter/material.dart';
import 'package:travelovers/account_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPerfil extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  EditPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageUserBloc, UserState>(
      builder: (context, state) {
        User? user;
        if (state is UserFound) {
          user = state.user;
        }
        return AccountForms("Editar perfil", _formKey, (){

        }, showLogin: false, user: user,);
      }
    );
  }
}