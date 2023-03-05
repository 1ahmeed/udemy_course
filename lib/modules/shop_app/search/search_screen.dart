import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/modules/shop_app/search/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/search/cubit/states.dart';
import 'package:udemy/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit,SearchStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextField(
                        controller: searchController,
                        keyboard:  TextInputType.text,
                        validate: (v){
                          if(v!.isEmpty)
                          {
                            return 'Search Can\'t be Empty';
                          }
                          else return null;
                        },
                        label: 'Search',
                       prefixicon: Icons.search,

                      onsubmit:  (value){
                          if(formKey.currentState!.validate())
                          {
                            ShopSearchCubit.get(context)?.getSearch(searchController.text);
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is ShopSearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is ShopSearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildProductItems(
                                ShopSearchCubit.get(context)?.searchModel.data!.data[index],
                                context,isOldPrice: false ),
                            separatorBuilder: (context, index) => SizedBox(height: 20,),
                            itemCount: ShopSearchCubit.get(context)!.searchModel.data!.data.length),
                      ),
                  ],
                ),
              ),
            ),
          )  ;
        },
      ),
    );

  }
}





/*
BlocProvider(
      create: (context) => ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextField(
                      controller: searchController,
                      keyboard: TextInputType.text,
                      onsubmit: (String text) {
                        ShopSearchCubit.get(context)?.model;

                      },
                      validate: (String? value){
                        if(value!.isEmpty){
                          return'Enter Text To Search';
                        }
                        return null;
                      },
                      label: "Search",
                      prefixicon: Icons.search,
                    ),
                    SizedBox(height: 10,),
                    if(state is ShopSearchLoadingState)
                      CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    if(state is ShopSearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder:(context, index) =>buildProductItems(
                                ShopSearchCubit.get(context)!.model!.data!.data[index],context
                            ),
                            separatorBuilder: (context, index) => SizedBox(width: 10,),
                            itemCount: ShopSearchCubit.get(context)!.model!.data!.data.length
                          //ShopSearchCubit.get(context)?.model!.data.data.length,
                        ),
                      ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
 */