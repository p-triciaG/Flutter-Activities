import 'package:activity/bloc/manage_user.dart';
import 'package:activity/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:activity/screens/account_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPerfil extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late String uid;

  EditPerfil({Key? key}) : super(key: key);

  _update(UserModel user, BuildContext context) {
    final isValid = _formKey.currentState?.validate();

    if (isValid!) {
      _formKey.currentState?.save();
      ManageUserBloc u = BlocProvider.of<ManageUserBloc>(context);
      u.add(UpdateUserEvent(uid, user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageUserBloc, UserState>(
      builder: (context, state) {
        UserModel? user;
        if (state is UserFound) {
          user = state.user;
          uid = state.id;
        }
        return AccountForms("Editar perfil", _formKey, (user) => _update(user, context), showLogin: false, user: user,);
      }
    );
  }
}