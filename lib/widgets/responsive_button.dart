import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/widgets/app_text.dart';
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
   ResponsiveButton({Key? key,
     this.isResponsive=false,
     this.width=120,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment:isResponsive==true? MainAxisAlignment.spaceBetween :MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin:EdgeInsets.only(left: 20),child: AppText(text: "Book Trip Now",color: Colors.black,size: 15,)) : Container(),
            Image.asset('images/p4.jpg'),
          ],
        ),
      ),
    );
  }
}
