import 'package:activity/bloc/manage_user.dart';
import 'package:flutter/material.dart';
import 'package:activity/models/location.dart';
import 'package:activity/screens/add_location.dart';
import 'package:activity/screens/edit_perfil.dart';
import 'package:activity/screens/perfil_1.dart';
import 'package:activity/screens/lista_locais.dart';
import 'package:activity/screens/perfil_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityTabBar extends StatefulWidget {
  const ActivityTabBar({Key? key}) : super(key: key);

  @override
  State<ActivityTabBar> createState() => _ActivityTabBarState();
}

class _ActivityTabBarState extends State<ActivityTabBar> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageUserBloc, UserState>(
      listener: (context, state) {
        if (state is! UserFound) {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/login');
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(

            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.lightGreen),
                    child: Text(
                      "Travelovers",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Configurações"),
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.pushNamed(context, "/settings");
                    }
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Sair"),
                    onTap: () {
                      Navigator.pop(context);
                      
                      BlocProvider.of<ManageUserBloc>(context).add(LogoutEvent());
                    }
                  ),
                ],
              ),
            ),
            appBar: AppBar(title: const Text("Publicações")
              // bottom: const TabBar(
              //   tabs: <Widget>[
              //     Tab(
              //       icon: Icon(Icons.beach_access_sharp),
              //     ),
              //     Tab(
              //       icon: Icon(Icons.account_circle),
              //     ),
              //     Tab(
              //       icon: Icon(Icons.brightness_5_sharp),
              //     ),
              //     Tab(
              //       icon: Icon(Icons.cloud),
              //     ),
              //   ],
              // ),
            ),
            body:
            // TabBarView(
            //   children: <Widget>[
                ListaLocais(),
              //   EditPerfil(),
              //   Perfil1(),
              //   Perfil2(),
            //   ],
            // ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, '/addLocation'),
            ),
          )
        );
      }
    );
  }
}
