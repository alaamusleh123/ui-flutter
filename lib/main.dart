import 'package:flutter/material.dart';
import 'package:travel_app/screens/detail_page.dart';
import 'package:travel_app/screens/home_page.dart';
import 'package:travel_app/screens/navepages/main_page.dart';
import 'package:travel_app/screens/navepages/my_page.dart';
import 'package:travel_app/screens/navepages/search_page.dart';
import 'package:travel_app/screens/welcome_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/detail_page',
      routes: {
        '/welcome_screen': (context) =>WelcomeScreen(),
        '/main_page': (context) =>MainPage(),
        '/my_page': (context) =>MyPage(),
        '/search_page': (context) =>SearchPage(),
        '/home_page': (context) =>HomePage(),
        '/detail_page':(context)=>DetailPage(),

      },
    );
  }
}
