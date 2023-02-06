import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images={
    "p5.jpg":"Balloning",
    "88.jpg":"Hiking",
    "99.jpg":"Kayaking",
    "55.jpg":"Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);//مهم انو حط الكونترولير جوا الويدجيت
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                const Icon(Icons.menu , size: 30, color: Colors.black54,),
                Expanded(child: Container()),  //عشان اعمل مسافة بين الايقونة و الكونتيينر
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppText(text: 'Discover', fontWeight: FontWeight.bold,size: 30,),
          ),
          const SizedBox(height: 20,),
          //tabbar
          Container(
            child:  Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: Colors.brown.shade900, radius: 4),
                  tabs: [
                    const Tab(text: 'Places',),
                    const Tab(text: 'Inspiration',),
                    const Tab(text: 'Emotions',),
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image:  const DecorationImage(
                          image: AssetImage(
                            "images/66.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },

                ),
                const Text('by'),
                const Text('hi'),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: "Explore more", size: 22,),
                AppText(text: "See all", size: 12,color: Colors.black45,)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          //هاي عشان يعمل لست فيو دوت بيلدر اخر الصفحة
          Container(
            height: 120,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
              return Container(
                margin: EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      //margin: const EdgeInsets.only(right:50,),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image:  DecorationImage(
                          image: AssetImage(
                            "images/"+images.keys.elementAt(index),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: AppText(text: images.values.elementAt(index),
                        color: Colors.black45,size: 14,),
                    ),
                  ],
                ),
              );
            }),
          ),

        ],
      ),
    );
  }
}
//كل هاد عشان بلاندكيتور او الخط الي تحت كل تاب في التاب بار لازم يكون شكلو دائرة صغيرة لازم اعمل نفس الشكل المطلوب بالصورة
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color , radius:radius);
  }
  
}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;     //هاد عشان الانديكيتور يجي في النث و يكون تحت الكلمة
    final Offset circleOffset=Offset(configuration.size!.width/2 -radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
  
}
