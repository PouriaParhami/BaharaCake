import 'package:BaharaConfectionary/data_res/data.dart';
import 'package:BaharaConfectionary/resorce/color_manager.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  final pictureUrls;

  const NavScreen({super.key, this.pictureUrls});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrlMap = widget.pictureUrls;
  }

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
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Birthday"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.coffee,
              ),
              label: "Coffee shop"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/rings.png")),
              label: "Wedding "),
        ],
        onTap: (int index) {
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
