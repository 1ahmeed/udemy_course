import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/modules/news_app/business/business.dart';
import 'package:udemy/modules/news_app/science/scienceScreen.dart';
import 'package:udemy/modules/news_app/sports/sportsScreen.dart';

import 'package:udemy/shared/network/remote/dio_helper.dart';

import '../../../shared/network/local/cache_helper.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(AppInitialStates());

  static NewsCubit? get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Widget>? screens = [
    businessScreen(),
    sportsScreen(),
    scienceScreen(),

  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    if(index==1) {
      getSports();
    }
    if(index==2) {
      getScience();
    }
    emit(NewsBottomNavBarStates());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey':
        'b43e759ff53545b8848deed5dac88e5c',
      },
    ).then((value) {
      if (value is FutureOr) {
        //print(value.data["articles"][0]["title"]);
        business = value.data["articles"];
        print(business[0]["title"]);
        emit(NewsGetBusinessSuccessStates());
      } //['articles'][0]['title']
    }).catchError((error) {
      print('error when bring data ${error.toString()}');
      emit(NewsGetBusinessErrorStates(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {

    emit(NewsGetSportsLoadingStates());

    if(sports.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey':
          'b43e759ff53545b8848deed5dac88e5c',
        },
      ).then((value) {
        if (value is FutureOr) {
          //print(value.data["articles"][0]["title"]);
          sports = value.data["articles"];
          print(sports[0]["title"]);
          emit(NewsGetSportsSuccessStates());
        } //['articles'][0]['title']
      }).catchError((error) {
        print('error when bring data ${error.toString()}');
        emit(NewsGetSportsErrorStates(error.toString()));
      });

    }else{
      emit(NewsGetSportsSuccessStates());
    }

  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingStates());

    if(science.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey':
          'b43e759ff53545b8848deed5dac88e5c',
        },
      ).then((value) {
        if (value is FutureOr) {
          //print(value.data["articles"][0]["title"]);
          science = value.data["articles"];
          print(science[0]["title"]);
          emit(NewsGetScienceSuccessStates());
        } //['articles'][0]['title']
      }).catchError((error) {
        print('error when bring data ${error.toString()}');
        emit(NewsGetScienceErrorStates(error.toString()));
      });

    }else{
      emit(NewsGetScienceSuccessStates());
    }

  }

  List<dynamic> search = [];

  void getSearch(String? value) {
    emit(NewsGetSearchLoadingStates());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey':
        'b43e759ff53545b8848deed5dac88e5c',
      },
    ).then((value) {
      if (value is FutureOr) {
        search = value.data["articles"];
        print(search[0]["title"]);
        emit(NewsGetSearchSuccessStates());
      } //['articles'][0]['title']
    }).catchError((error) {
      print('error when bring data ${error.toString()}');
      emit(NewsGetSearchErrorStates(error.toString()));
    });

  }






  bool isDark=false;
  void changeMode({bool? fromShared}){
    if(fromShared != null){
      isDark =fromShared;
    }else
      isDark =  !isDark;
    CacheHelper.putBoolean(key: "isDark", value: isDark).
    then((value) {
      emit(NewsChangeModeStates());
    });


  }



}