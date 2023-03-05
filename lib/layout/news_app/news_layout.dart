import 'dart:async';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/modules/news_app/search/search_screen.dart';

import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
        var cubit = NewsCubit.get(context);

          return Scaffold(
            // key: ,
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, size: 30,),
                  onPressed: () {
                   navigatorTo(context, SearchScreen());
                  },),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined, size: 30,),
                  onPressed: () {
                    NewsCubit.get(context)?.changeMode();
                  },)
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit!.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business,),
                  label: 'Business',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports,),
                  label: 'Sports',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined,),
                  label: 'Science',

                ),

              ],
            ),
            body: cubit.screens![cubit.currentIndex],


          );
        });
  }


}
