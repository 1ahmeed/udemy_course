import 'package:udemy/models/shop_app/search_model.dart';

abstract class SearchStates{}

class ShopSearchInitialState extends SearchStates{}

class ShopSearchLoadingState extends SearchStates{}

class ShopSearchSuccessState extends SearchStates{

}

class ShopSearchErrorState extends SearchStates
{
  final String error;
  ShopSearchErrorState(this.error);
}