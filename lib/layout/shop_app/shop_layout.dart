import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/cubit/states.dart';
import 'package:udemy/modules/shop_app/search/search_screen.dart';
import 'package:udemy/modules/shop_app/login/login_screen.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/network/local/cache_helper.dart';
import 'package:udemy/shared/styles/colors.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit!.title[cubit.currentIndex],
                style:
            TextStyle(fontSize: 30,color: defaultColor),),
            actions: [IconButton(
                onPressed: () {
                  navigatorTo(context,SearchScreen());
                },
                icon: Icon(Icons.search,size: 30,color: defaultColor,),
            )],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeCurrentIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          ),
          body: cubit.screens![cubit.currentIndex],
        );
      },
    );
  }
}
