import 'package:flutter/material.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import 'app_text.dart';

class AppContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String largetitle;
  final Image image;
  int _currentPage = 0;

   //var indexDots;

   AppContent({
    Key? key,
     required this.title,
     required this.subtitle,
     this.largetitle='aa',
     required this.image,
    // this.indexDots=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      image,
        Container(
          margin: EdgeInsets.only(top: 150, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: title),//'Trips'
                  AppText(text:subtitle ,//'Mountain'
                    size: 30,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,),
                  SizedBox(height: 10,),
                  Container(
                    width: 250,
                    child: AppText(
                      text:largetitle,
                      size: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 30,),
                  ResponsiveButton(width: 120,),
                ],
              ),
              Column(
                  children:List.generate(3, (index){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index ==_currentPage ?25 : 8,

                     // height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                    );
                  } ),
             ),
            ],
          ),
        ),
      ],
    );
  }
}
