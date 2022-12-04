import 'dart:async';

import 'package:activity/screens/account_settings.dart';
import 'package:activity/bloc/manage_user.dart';
import 'package:activity/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen.dart';
import '../models/UserModel.dart';

class SingUp extends StatefulWidget {
  SingUp({
    Key? key,
  }) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageUserBloc, UserState>(
      listener: (context, state) {
        if(state is UserFound) {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/home');
        } else if(state is UserError) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)));
        }
        else {
          if (state is! UserNotFound) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Usuário cadastrado')));
            Navigator.pop(context);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: AccountForms("Criar conta", _formKey, _submit)
        );
      }
    );
  }

  _submit(UserModel user) {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Preencha os campos adequadamente')));
    }

    _formKey.currentState?.save();

    ManageUserBloc u = BlocProvider.of<ManageUserBloc>(context);
    u.add(SignUpEvent(user));
  }
}
