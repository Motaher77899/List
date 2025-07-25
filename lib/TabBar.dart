import 'package:flutter/material.dart';
import 'package:list/widget/Own_widget.dart';

import 'ListScreen.dart';
import 'Travel.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Tab Bar'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
          bottom: TabBar(

              tabs:[
                Tab(
                  icon: Icon(Icons.home),text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.star),text: 'Star',
                ),
                Tab(
                  icon: Icon(Icons.settings),text: 'Setting',
                )
              ]
          ),
        ),
        body: TabBarView(


            children: [
          OwnWidget(),
          TravelHomeScreen(),
          Listscreen()

        ]
        ),

      ),
    );
  }
}
