import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../widgets/app_content.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController= PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        //controller: _pageController,
        scrollDirection: Axis.vertical,
        // onPageChanged: (int page){
        //   setState(() {
        //     _currentPage =page;
        //   });
        // },
        children: [
          AppContent(title: 'Trips',
            subtitle: 'Mountain',
            largetitle:
            'Mountain hikes give you an incredible sense of freedom along with endurance test',
            image: Image.asset('images/p1.jpg',
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover),
          ),

          AppContent(title: 'Trips',
            subtitle: 'Mountain',
            image:Image.asset('images/p2.jpeg',
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover
            ) ,
          ),

          AppContent(title: 'let\'s start',
            subtitle: 'are you ready?',
            largetitle: 'I am sure you will enjoy',
            image: Image.asset('images/p3.jpg',
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover),
          ),

        ],
      ),
    );
  }
}


