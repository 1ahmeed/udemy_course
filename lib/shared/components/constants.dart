

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=b43e759ff53545b8848deed5dac88e5c


//base url: https://newsapi.org/
// method (url):v2/top-headlines?
// query: country=eg&category=business&apiKey=b43e759ff53545b8848deed5dac88e5c


//https://newsapi.org/v2/everything?q=tesla&apiKey=b43e759ff53545b8848deed5dac88e5c

//base url: https://newsapi.org/
// method (url):v2/everything?
// query: q=tesla&apiKey=b43e759ff53545b8848deed5dac88e5c

import 'package:udemy/modules/shop_app/login/login_screen.dart';
import 'package:udemy/shared/components/components.dart';

import '../network/local/cache_helper.dart';

void signout(context) {
  CacheHelper.removeData(key: 'token').then((value){
    if(value==true){
      navigatorAndFinish(context, ShopLoginScreen());
    }
  });
}
void printFullText(String? text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text!).forEach((match) => print(match.group(0)));

}
String token='';


