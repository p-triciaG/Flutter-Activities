// import 'package:activity/bloc/manage_user.dart';
// import 'package:activity/sing_up_screen.dart';
// import 'package:activity/tab_bar_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final String logoPath = "image/travel_lovers_logo.jpg";
//   String? email = "";
//   String? senha = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocBuilder<ManageUserBloc, UserState>(
//         buildWhen: (previous, current) {
//           if(current is UserFound) {
//             Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => const ActivityTabBar()));
//           }
//           else if (current is UserNotFound) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Usuário não encontrado'))
//             );
//           }
//           return false;
//         },
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(top: 60.0),
//                   child: Center(
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       height: 200,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: AssetImage(
//                               logoPath,
//                             ),
//                             fit: BoxFit.fill),
//                         border: Border.all(
//                           color: Colors.lightGreen,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   child: TextField(
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Email',
//                         hintText: 'Insira um email válido como abc@gmail.com'),
//                     onChanged: (value) => email = value,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 15.0, right: 15.0, top: 15, bottom: 0),
//                   //padding: EdgeInsets.symmetric(horizontal: 15),
//                   child: TextField(
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Senha',
//                         hintText: 'Insira uma senha segura'),
//                     onChanged: ((value) {
//                       senha = value;
//                     }),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     'Esqueci a senha',
//                     style: TextStyle(color: Colors.blue, fontSize: 15),
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                   width: 250,
//                   decoration: BoxDecoration(
//                       color: Colors.lightGreen,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (email!.isEmpty || senha!.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Preencha email e senha corretamente'))
//                         );
//                       }
//                       else{
//                         ManageUserBloc u = BlocProvider.of<ManageUserBloc>(context);
//                         u.add(SignInEvent(email!, senha!));
//                       }
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (_) => ActivityTabBar()));
//                     },
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white, fontSize: 25),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 130,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Novo por aqui?'),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context, MaterialPageRoute(builder: (_) => SingUp()));
//                         },
//                         child: const Text(
//                           "Criar uma conta",
//                           style: TextStyle(color: Colors.lightGreen),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           );
//         }
//       ),
//     );
//   }
// }
