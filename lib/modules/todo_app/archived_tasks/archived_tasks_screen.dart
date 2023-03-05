import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/cubit/states.dart';




class ArchivedTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener:(context, state)
        {} ,
        builder:(context, state) {
          var tasks=AppCubit.get(context)!.archivedTasks;


          return buildConditionalBuilder(tasks: tasks);
        });
  }
}