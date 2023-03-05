import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy/modules/shop_app/login/login_screen.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/network/local/cache_helper.dart';
import 'package:udemy/shared/styles/colors.dart';

class boardingModel {
  final String image;
  final String title;
  final String body;

  boardingModel({
    required this.body,
    required this.title,
    required this.image,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<boardingModel> boarding = [
    boardingModel(
      image: 'assets/images/board1.jpg',
      title: 'Sallah',
      body: 'Let\'s go shopping',
    ),
    boardingModel(
      image: 'assets/images/board2.jpg',
      title: 'Sallah',
      body: 'See Special Offers',
    ),
    boardingModel(
      image: 'assets/images/board3.jpg',
      title: 'Sallah',
      body: 'Choose Favourite Product',
    ),
  ];

  bool isLast = false;
  var boardController = PageController();
   void submit(){
     CacheHelper.saveData(
         key: 'onBoarding',
         value: true).then((value){
       if(value==true){
         navigatorAndFinish(context, ShopLoginScreen());
       }

     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            onPressed: () {
              submit();
              },
            text:"SKIP",
        style: TextStyle(fontSize: 18,color: Colors.deepPurple),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                        width: 32,
                        height: 12,
                        color: defaultColor,
                        rotationAngle: 180,
                        verticalOffset: -10,
                        borderRadius: BorderRadius.circular(24),
                        // dotBorder: DotBorder(
                        //   padding: 2,
                        //   width: 2,
                        //   color: Colors.indigo,
                        // ),
                      ),
                      activeDotDecoration: DotDecoration(
                        width: 24,
                        height: 12,
                        color: Colors.black,
                        // dotBorder: DotBorder(
                        //   padding: 2,
                        //   width: 2,
                        //   color: Colors.grey,
                        // ),
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(2),
                        //     topRight: Radius.circular(16),
                        //     bottomLeft: Radius.circular(16),
                        //     bottomRight: Radius.circular(2)),
                        borderRadius: BorderRadius.circular(16),
                        verticalOffset: 0,
                      ),
                      spacing: 6.0,
                      // activeColorOverride: (i) => colors[i],
                      // inActiveColorOverride: (i) => colors[i] ,
                    ),
                    controller: boardController,
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(boardingModel model) => Column(
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${model.title}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${model.body}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      );
}
