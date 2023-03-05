

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/models/shop_app/login_model.dart';
import 'package:udemy/modules/shop_app/login/cubit/states.dart';
import 'package:udemy/shared/network/end_points.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{

  ShopLoginCubit() : super(ShopLoginInitialStates());
  static ShopLoginCubit? get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;

  void userLogin({
  required String email,
    required String password,
}){
    emit(ShopLoginLoadingStates());
    DioHelper.postData(
        url: LOGIN,
        token: '',
        data: {
      'email':email,
      'password':password
        }).then((value) {
          print(value.data);
         loginModel= ShopLoginModel.fromJson(value.data);
        // print(loginModel?.status);
        //   print(loginModel?.message);
        //  print(loginModel?.data?.token);
          emit(ShopLoginSuccessStates(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorStates(error.toString()));
    });

  }

  IconData? suffix= Icons.visibility;
  bool isPassword=true;
  void changeVisibility(){

    isPassword= !isPassword;
    suffix=isPassword? Icons.visibility:Icons.visibility_off_sharp;
      emit(ShopChangeVisibilityStates());

  }
}