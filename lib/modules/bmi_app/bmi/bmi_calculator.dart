import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../bmi_result/bmi_result.dart';

class bmi_calculator extends StatefulWidget {
 


  @override
  State<bmi_calculator> createState() => _bmi_calculatorState();
}

class _bmi_calculatorState extends State<bmi_calculator> {
  bool  isMale=true;
  double height=120;
  int age=50;
  double weight=100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("BMI Calculator",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(

          children: [
            //first part
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=true;
                          });

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:isMale ? Colors.grey.shade600:Colors.black,

                          ),
                          //color: Colors.,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/images/male.png"),
                              width: 90,
                              height: 90,),

                              SizedBox(
                                height: 10,
                              ),
                              Text("MALE",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                  color: Colors.white,
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: GestureDetector(
                      onTap: (){
                       setState(() {
                         isMale=false;
                       });
                      },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:isMale ? Colors.black:Colors.grey.shade600,
                          ),
                          //color: Colors.,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/images/female.png"),
                              width: 90,
                              height: 90,),

                              SizedBox(
                                height: 10,
                              ),
                              Text("FEMALE",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //second part
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("HEIGHT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("${height.round()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 50,
                            ),),
                          SizedBox(
                            width: 5,
                          ),
                          Text("CM",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.deepPurple,
                          inactiveColor: Colors.purple.shade500,

                          value: height,
                          max: 210,
                          min: 80,
                          onChanged: (value){
                            setState(() {
                              height=value;
                            });
                          })

                    ],
                  ),
                ),
              ),
            ),
            //third part
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("age",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            Text("${age.round()}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              color: Colors.white,
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  heroTag: "age+",
                                child: Icon(Icons.add),mini: true,
                                backgroundColor: Colors.deepPurple,
                                ),
                                SizedBox(width:40 ,),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });

                                },
                                  heroTag: "age-",
                                  child: Icon(Icons.remove),mini: true,
                                backgroundColor: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("weight",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            Text("${weight.round()}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              color: Colors.white,
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                  heroTag: "weight+",
                                  child: Icon(Icons.add),mini: true,
                                backgroundColor: Colors.deepPurple,
                                ),
                                SizedBox(width:40 ,),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });

                                },
                                  heroTag: "weight-",
                                  child: Icon(Icons.remove),mini: true,
                                backgroundColor: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
             //fourth part
             Container(
               color: Colors.deepPurple,

               width: double.infinity,

               child: MaterialButton(
                 onPressed: (){
                   double result=weight/pow(height/100, 2);
                   print(result.round());
                   Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context)=>bmi_result(
                            age: age,
                            isMail:isMale ,
                            result: result.round(),
                          )),
                  );
                 },
                 child: Text("CALCULATE",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.white
                 ),),
               ),


            ),

          ],
        ),
      ),



    );
  }
}
