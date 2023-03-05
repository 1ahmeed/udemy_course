import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 20,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThjQA8DnMemvaaPzpuvIAWbEmQO7dNVCCmfQ&usqp=CAU")),
              SizedBox(
                width: 10,
              ),
              Text(
                "Chats",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.white,),
                      SizedBox(width: 10),
                      Text(
                        "search",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
               //stories listview
               Container(
                 height: 110,

                   child: ListView.separated(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                       itemBuilder:(context,index)=>storybuilder() ,
                       separatorBuilder:(context,index)=>
                         SizedBox(width: 10,),
                       itemCount:10 ),
                 ),

                SizedBox(
                  height: 10,
                ),
                //cahts listview
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index)=>chatbuilder(),
                    separatorBuilder: (context,index)=>
                        SizedBox(height: 20,),
                    itemCount: 15),
              ],
            ),
          ),
        ));
  }

  Widget storybuilder()=>Container(
    width: 60,
    child: Column(
      children: [
        Stack(alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThjQA8DnMemvaaPzpuvIAWbEmQO7dNVCCmfQ&usqp=CAU"),
              ),
              CircleAvatar(
                radius: 9,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ]),
        SizedBox(
          height: 10,
        ),
        Text("ahmed tarek elhefnawy",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
      ],
    ),
  );
Widget  chatbuilder()=> Row(
  children: [
    Stack(alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThjQA8DnMemvaaPzpuvIAWbEmQO7dNVCCmfQ&usqp=CAU"),
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          ),
        ]),
    SizedBox(
      width: 10,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ahmed tarek elhefnawy",style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child:
                  Text("hello my friend i\'m happy to chat with you on this messenger bro",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,)

              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    color: Colors.black
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Text("02:30", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
            ],
          ),

        ],
      ),
    )
  ],
);

}
