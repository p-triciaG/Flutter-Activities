import 'package:flutter/material.dart';
import 'package:activity/account_settings.dart';

class EditPerfil extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  EditPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountForms("Editar perfil", _formKey, (){

    }, showLogin: false,);
  }
}