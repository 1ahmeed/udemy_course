import 'package:flutter/material.dart';

class bmi_result extends StatelessWidget {

 final int result;
final bool isMail;
final int age;

bmi_result({
  required this.result, required this.isMail, required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);

          },

        ),
        backgroundColor: Colors.deepPurple,
        title: Text("BMI Result",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),


      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  height: 50,
                  width: 300,
                  child: Text("gender: ${isMail? 'male':'female'}",
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 40,
                      //fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),



                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    width: 200,
                    height: 50,

                    child: Text("result:$result", style: TextStyle(
                              fontSize: 40,
                           // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    textAlign: TextAlign.center,),

                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 200,
                      height: 50,

                      child: Text("age:$age", style: TextStyle(
                              fontSize: 40,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        textAlign: TextAlign.center,),
                      ),
                  ),




                ],

              ),
            ),



//Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("gender:${isMail? 'male':'female'}",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                       ),),
//                       Text("result:$result", style: TextStyle(
//                           fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),),
//                       Text("age:$age", style: TextStyle(
//                           fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),),
//
//                     ],
//                   ),
          ],
        ),
      ),
    );
  }
}
