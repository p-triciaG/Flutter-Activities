import 'package:activity/bloc/manage_user.dart';
import 'package:flutter/material.dart';
import 'package:activity/screens/lista_locais.dart';
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
            appBar: AppBar(title: const Text("Publicações")),
            body: ListaLocais(),
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
