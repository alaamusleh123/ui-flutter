import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenstars=4;
  int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                  right: 0,
                  child:Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/jabal.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: Colors.white,),

                    // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_sharp)),
                  ],
                ),),
              Positioned(
                top: 320,
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "Yosemite"),
                          AppText(text: "\$ 250",color: Colors.black38,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.black45,),
                          SizedBox(height: 5,),
                          AppText(text: "USA,California", color: Colors.black26, size: 15,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      //عشان نعمل شكل النجمات زي التقيم هنعمل هاد الاشي
                      Row(
                        children: [
                          Wrap(
                            children:List.generate(5, (index) {
                              return Icon(Icons.star, color:index<gottenstars? Colors.yellow.shade300 :Colors.black26);
                            }),
                          ),
                          SizedBox(width: 10,),
                          AppText(text: "(4.0)", color: Colors.black38,size: 15,)
                          
                        ],
                      ),
                      SizedBox(height: 25,),
                      AppText(text: 'People',color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height:5,),
                      AppText(text: "Number of people in your group", color: Colors.black38,size: 12,),
                      SizedBox(height:10,),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                  color: selectedIndex==index?Colors.white :Colors.black,
                                  backgroundColor:selectedIndex==index? Colors.black :Colors.black12,
                                  borderColor: selectedIndex==index?Colors.black:Colors.black12,
                                  size: 50,
                                text: (index+1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height:20,),
                      AppText(text: 'Description', color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height:10,),
                      AppText(
                          text:
                          "You must go for a travil,Travilling helps get rid of pressure, Go to the mountains to sere the neture. ",
                        size: 17,
                        color: Colors.black26,
                      )

                      
                    ],
                  ),
              ),),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                        color: Colors.black38,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black38,
                        size: 60,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive: true,

                    ),
                  ],
                ),),
            ],
          ),
      ),
    );
  }
}
