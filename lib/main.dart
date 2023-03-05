import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/layout/news_app/news_layout.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/shop_layout.dart';
import 'package:udemy/modules/shop_app/login/login_screen.dart';
import 'package:udemy/modules/shop_app/onboarding_screen/onboarding_screen.dart';

//import 'package:udemy/modules/bmi/bmi_calculator.dart';
import 'package:udemy/shared/block_observer.dart';
import 'package:udemy/shared/components/constants.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/cubit/states.dart';
import 'package:udemy/shared/network/local/cache_helper.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';
import 'package:udemy/shared/styles/themes.dart';
import 'layout/todo_app/todo_Layout.dart';

//import 'modules/login/login_screen.dart';
//import 'modules/messenger_screen/messenger_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: "isDark");
  Widget? widget;
   token = CacheHelper.getData(key: "token");
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");
  print(token);
  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else {
      widget = ShopLoginScreen();
    }
  }else{
    widget= OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
   bool? isDark;
  Widget? startWidget;

  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..changeMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavourites()..getUserData(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context)!.isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}
