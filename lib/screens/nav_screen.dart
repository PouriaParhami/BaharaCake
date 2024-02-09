import 'package:baharacake/data_res/data.dart';
import 'package:baharacake/resorce/color_manager.dart';

import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorGold,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.primaryColorGold,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Birthday"),
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Coffeeshop"),
          BottomNavigationBarItem(icon: Icon(Icons.ring_volume), label: "Wedding "),
        ],
        onTap: (int index){
          setState(() {
            selectIndex = index;
          });
        },
        currentIndex: selectIndex,
      ),
      body: screens.elementAt(selectIndex),
    );
  }
}

