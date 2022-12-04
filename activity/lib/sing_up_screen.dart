// import 'dart:async';

// import 'package:activity/account_settings.dart';
// import 'package:activity/bloc/manage_user.dart';
// import 'package:activity/tab_bar_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'login_screen.dart';
// import 'models/User.dart';

// class SingUp extends StatefulWidget {
//   SingUp({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _SingUpState createState() => _SingUpState();
// }

// class _SingUpState extends State<SingUp> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: AccountForms("Criar conta", _formKey, _submit)
//     );
//   }

//   _submit(User user) {
//     final isValid = _formKey.currentState?.validate();
//     if (!isValid!) {
//       return ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: const Text('Preencha os campos adequadamente')));
//     }

//     _formKey.currentState?.save();

//     ManageUserBloc u = BlocProvider.of<ManageUserBloc>(context);
//     u.add(SignUpEvent(user));
//     setState(() {
//       Timer(
//           Duration(seconds: 5),
//           () => Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => Login())));
      
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: const Text('Usuário cadastrado')));
//     });
//   }
// }
