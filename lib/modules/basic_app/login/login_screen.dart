import 'package:flutter/material.dart';
import 'package:udemy/shared/components/components.dart';

class login_screen extends StatefulWidget {
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  var email = TextEditingController();

  var pass = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "login",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    /////
                    defaultTextField(
                      controller: email,
                      label: "email_address",
                      keyboard: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('Email is wrong');
                        }
                        return null;
                      },
                      prefixicon: Icons.email,

                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextField(
                      validate: (value){
                        if(value!.isEmpty){
                          print("password is wong");
                        }
                        return null;
                      },
                      keyboard: TextInputType.visiblePassword,
                      controller:pass ,
                      label: "password",
                      prefixicon: Icons.lock,
                      ispassword:ispassword,
                     suffixicon:ispassword? Icons.visibility:Icons.visibility_off,
                      suffixpressed: (){
                        setState(() {
                          ispassword= !ispassword;
                        });



                      }
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    //container
                    defaultButton(
                      text: "LOGIN",
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(email.text);
                          print(pass.text);
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don\'t have account",
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "register now",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
