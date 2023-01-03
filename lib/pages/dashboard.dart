import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:simbo_1/pages/homepage.dart';
import 'package:simbo_1/pages/recensement_step.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required String username}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  final screens = [
    HomePage(),
    RecensementStep(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      const Icon(Icons.menu, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.settings, size: 30),
    ];

    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(microseconds: 300),
            color: Colors.white,
            buttonBackgroundColor: Color.fromRGBO(91, 202, 167, 0.4),
            backgroundColor: Colors.transparent,
            height: 60,
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
      ),
    );
  }
}
