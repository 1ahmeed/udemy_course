import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/models/users/user_model.dart';



class userscreen extends StatelessWidget {
  List<usermodel> user = [
    usermodel(id: 1, name: "ahmed", phone: "1234"),
    usermodel(id: 2, name: "mohamed", phone: "01478"),
    usermodel(id: 3, name: "ali", phone: "01478"),
    usermodel(id: 4, name: "haidy", phone: "01478"),
    usermodel(id: 5, name: "kareem", phone: "01478"),
    usermodel(id: 6, name: "sabry", phone: "01478"),
    usermodel(id: 7, name: "tarek", phone: "01478"),
    usermodel(id: 8, name: "mona", phone: "01478"),
    usermodel(id: 9, name: "ahmed", phone: "1234"),
    usermodel(id: 10, name: "mohamed", phone: "01478"),
    usermodel(id: 11, name: "ali", phone: "01478"),
    usermodel(id: 12, name: "haidy", phone: "01478"),
    usermodel(id: 13, name: "kareem", phone: "01478"),
    usermodel(id: 14, name: "sabry", phone: "01478"),
    usermodel(id: 15, name: "tarek", phone: "01478"),
    usermodel(id: 16, name: "mona", phone: "01478"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "users",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => builduser(user[index]),

            separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black26,
                ),
            itemCount: user.length));
  }

  Widget builduser(usermodel user) =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(
                "${user.id}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(("${user.phone}")),
              ],
            ),
          ],
        ),
      );
}
