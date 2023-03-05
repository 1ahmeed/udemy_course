import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/cubit/states.dart';



class DoneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
        listener:(context, state)
        {} ,
        builder:(context, state) {
          var tasks=AppCubit.get(context)!.doneTasks;


          return buildConditionalDoneBuilder(tasks:tasks);
        });
  }
}
