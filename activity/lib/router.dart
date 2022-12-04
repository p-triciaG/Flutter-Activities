
import 'package:activity/screens/add_location.dart';
import 'package:activity/screens/login_screen.dart';
import 'package:activity/screens/sing_up_screen.dart';
import 'package:activity/screens/splash_screen.dart';
import 'package:activity/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:activity/bloc/manage_location.dart';
import 'package:activity/bloc/manage_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final ManageUserBloc _userBloc = ManageUserBloc(UserState());
  final ManageLocationBloc _locationBloc = ManageLocationBloc();

  Route onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case '/home':
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _userBloc),
            BlocProvider.value(value: _locationBloc),
          ],
          child: const ActivityTabBar(),
        ));
      case '/login':
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _userBloc,
          child: Login(),
        ));
      case '/signup':
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _userBloc,
          child: SingUp(),
        ));
      case '/addLocation':
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _locationBloc,
          child: const AddLocation(),
        ));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
  
  void dispose() {
    _userBloc.close();
    _locationBloc.close();
  }
}