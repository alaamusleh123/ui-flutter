import 'package:flutter/material.dart';
import 'package:travel_app/screens/navepages/bar_item_page.dart';
import 'package:travel_app/screens/home_page.dart';
import 'package:travel_app/screens/navepages/my_page.dart';
import 'package:travel_app/screens/navepages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex=0;

  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];

  void onTap(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:pages[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Icon(Icons.apps,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.bar_chart_sharp,),
              label: 'Bar'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.search,),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person,),
              label: 'My'
          ),
        ],
      ),
    );
  }
}
