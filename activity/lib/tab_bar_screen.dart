import 'package:activity/our_team.dart';
import 'package:activity/publi_form.dart';
import 'package:activity/trip_packages.dart';
import 'package:flutter/material.dart';

class ActivityTabBar extends StatefulWidget {
  const ActivityTabBar({Key? key}) : super(key: key);

  @override
  State<ActivityTabBar> createState() => _ActivityTabBarState();
}

class _ActivityTabBarState extends State<ActivityTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Widget'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: OurTeam(),
              ),
              Center(
                child: TripPackages(),
              ),
              Center(
                child: PubliForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}