import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/models/shop_app/login_model.dart';
import 'package:udemy/models/shop_app/search_model.dart';
import 'package:udemy/modules/shop_app/search/cubit/states.dart';
import 'package:udemy/shared/components/constants.dart';
import 'package:udemy/shared/network/end_points.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';

class ShopSearchCubit extends Cubit<SearchStates> {
  ShopSearchCubit() : super(ShopSearchInitialState());

  static ShopSearchCubit? get(context) => BlocProvider.of(context);
  late SearchModel searchModel;
  void getSearch(String text){
    emit(ShopSearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          'text':text
        }).then((value) {
      searchModel=SearchModel.fromJson(value.data);
      emit(ShopSearchSuccessState());
    }).catchError((error){
      print(error);
      emit(ShopSearchErrorState(error));
    });
  }


  //  void search(String text) {
  //   emit(ShopSearchLoadingState());
  //   DioHelper.postData(
  //     url: SEARCH,
  //     token: token,
  //     data: {'text': text},
  //   ).then((value){
  //     model=SearchModel.fromJson(value.data);
  //     emit(ShopSearchSuccessState());
  //   } ).catchError((error){
  //     print(error.toString());
  //     emit(ShopSearchErrorState(error));
  //   });
  // }




}
