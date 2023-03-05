import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  var searchController=TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state) {},
      builder:(context, state) {
        var list =NewsCubit.get(context)?.search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextField(
                    controller: searchController,
                    keyboard: TextInputType.text,
                    onchange: (value){
                      NewsCubit.get(context)?.getSearch(value);
                    },
                    validate: (String? value){
                      if(value!.isEmpty){
                        return"Search must not be empty";
                      }
                      return null;
                    },
                    label: "Search",
                    prefixicon: Icons.search),
              ),
              Expanded(
                  child:
                  buildConditionBuilderForArticles(list,context,isSearch:true))

            ],
          ),
        );
      } ,

    );
  }
}
