import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/modules/news_app/web_view/web_view_screen.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/styles/colors.dart';

void navigatorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigatorAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultButton({
  double wide = double.infinity,
  Color background = Colors.deepPurple,
  required void Function()? function,
  required String text,
  TextStyle? style
}) =>
    Container(
      width: wide,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

Widget defaultTextButton({
  required void Function()? onPressed,
  required String text,
  TextStyle? style,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: style,
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType keyboard,
  required String? Function(String?)? validate,
  void Function(String)? onsubmit,
  void Function(String)? onchange,
  void Function()? ontap,
  required String label,
  bool isclickable = true,
  required IconData? prefixicon,
  void Function()? suffixpressed,
  IconData? suffixicon,
  bool ispassword = false,
  Color? colorIcon,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboard,
      //TextInputType.emailAddress
      obscureText: ispassword,

      enabled: isclickable,
      onFieldSubmitted: onsubmit,
      onChanged: onchange,
      onTap: ontap,
      //cursorColor: Colors.teal,
      validator: validate,
      decoration: InputDecoration(
        // labelStyle: TextStyle(color: Colors.teal),
        enabledBorder: OutlineInputBorder(),

        //fillColor:Colors.red,
        labelText: label,
        prefixIcon: Icon(
          prefixicon,
          //Icons.email,
          color: colorIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixicon),
          onPressed: suffixpressed,
          //Icons.email,
          //color: colorIcon,
        ),
        border: OutlineInputBorder(),
      ),
    );

Widget buildTasksItem(Map models, context) => Dismissible(
      key: Key(models['id'].toString()),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        color: Colors.teal,
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        color: Colors.teal,
      ),
      onDismissed: (direction) {
        AppCubit.get(context)?.deleteData(id: models['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  "${models['time']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${models['title']}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${models['date']}",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      ?.updateData(status: "done", id: models['id']);
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.teal,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      ?.updateData(status: "archived", id: models['id']);
                },
                icon: Icon(
                  Icons.archive_outlined,
                  color: Colors.teal,
                ))
          ],
        ),
      ),
    );

Widget buildTasksDoneItem(Map models, context) => Dismissible(
      key: Key(models['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context)?.deleteData(id: models['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  "${models['time']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${models['title']}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${models['date']}",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      ?.updateData(status: "done", id: models['id']);
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.teal,
                )),
            // IconButton(
            //     onPressed: (){
            //       AppCubit.get(context)?.updateData(
            //           status:"archived",
            //           id: models['id']);
            //     },
            //     icon: Icon(Icons.archive_outlined,color: Colors.teal,))
          ],
        ),
      ),
    );

Widget buildConditionalDoneBuilder({
  required List<Map<dynamic, dynamic>>? tasks,
}) =>
    ConditionalBuilder(
      condition: tasks!.isNotEmpty, //==tasks!.length >0
      builder: (context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) => buildTasksDoneItem(
          tasks[index],
          context,
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              color: Colors.grey,
              size: 100,
            ),
            Text(
              "No Tasks Yet, Please Add Some Tasks",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );

Widget buildConditionalBuilder({
  required List<Map<dynamic, dynamic>>? tasks,
}) =>
    ConditionalBuilder(
      condition: tasks!.isNotEmpty, //==tasks!.length >0
      builder: (context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) => buildTasksItem(
          tasks[index],
          context,
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              color: Colors.grey,
              size: 100,
            ),
            Text(
              "No Tasks Yet, Please Add Some Tasks",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
/////////////////////////////////

Widget buildArticlesItem(articles, context) => InkWell(
      onTap: () {
        navigatorTo(context, WebViewScreen(articles['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage("${articles['urlToImage']}"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${articles['title']}",
                        style: TextStyle(
                            color: NewsCubit.get(context)!.isDark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20),
                        /*Theme.of(context).textTheme.bodyText1,*/
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      "${articles['publishedAt']}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildConditionBuilderForArticles(list, context, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticlesItem(list[index], context),
          separatorBuilder: (context, index) => SizedBox(
                height: 0,
              ),
          itemCount: list.length),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void showToast({
        required String text,
 required ToastStates state
})=> Fluttertoast.showToast(
    msg:  text,
//state.loginModel?.message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates {SUCCESS,ERROR,WARNING}

 Color? chooseToastColor(ToastStates state){
  Color? color;
  switch(state){
    case ToastStates.SUCCESS:
    color=Colors.deepPurple.shade600;
    break;

    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
  return color;
 }

Widget buildProductItems( model,context,{bool isOldPrice=true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(image: NetworkImage(model.image.toString()),
              width: 120,
              height: 120,
            ),
            if(model.discount != 0 && isOldPrice && model.price!= model.oldPrice  )
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: Text("DISCOUNT",
                  style: TextStyle(color: Colors.white,
                      fontSize: 14
                  ),),
              )
          ],
        ),
        SizedBox(width:5 ,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    model.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: defaultColor),

                  ),
                  SizedBox(width: 5,),
                  if(model.discount != 0 && isOldPrice && model.price!= model.oldPrice  )
                    Text(
                      model.oldPrice.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),


                    ),
                  Spacer(),
                  IconButton(
                    icon:  CircleAvatar(
                        radius: 17,
                        backgroundColor:
                        ShopCubit.get(context)!.favourites[model.id]==true ?defaultColor:Colors.grey,
                        child: Icon(Icons.favorite_border,
                          size: 17,
                          color: Colors.white,
                        )),
                    onPressed: (){
                      //print(model.id);
                      ShopCubit.get(context)!. changeFavourites(model.id!);
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
