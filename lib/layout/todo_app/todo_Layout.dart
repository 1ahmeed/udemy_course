import 'dart:async';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/cubit/states.dart';
import '../../shared/cubit/cubit.dart';

class Home_Layout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..createDatabase(),

      child:BlocConsumer<AppCubit,AppStates>(
        listener:(context, state) {
          if(state is AppInsertDatabaseStates){
            Navigator.pop(context);
          }
        } ,
        builder:(context, state) {
          AppCubit? cubit=AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text(cubit!.title[cubit.currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
                child:Icon(cubit.fabicon,),
                onPressed:(){
                  if(cubit.isBottomsheetshown){
                    if(formKey.currentState!.validate()){
                     cubit.insertDatabase(
                        date: dateController.text,
                        time: timeController.text,
                        title: titleController.text,
                      );}
                  }else{
                    scaffoldKey.currentState?.showBottomSheet((context) =>
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextField(
                                    controller: titleController,
                                    keyboard: TextInputType.text,
                                    validate: (String? value){
                                      if(value!.isEmpty){
                                        return "title must not be empty";
                                      }
                                      return null;

                                    },
                                    label: " Task title",
                                    prefixicon: Icons.title,
                                    colorIcon: Colors.teal
                                ),
                                const SizedBox(height: 20,),
                                defaultTextField(
                                    controller: timeController,
                                    keyboard: TextInputType.datetime,
                                    isclickable: false,
                                    ontap: (){
                                      showTimePicker(
                                          context: context,
                                          initialTime:TimeOfDay.now()).
                                      then((value){
                                        if(value is FutureOr) {
                                          timeController.text= value?.format(context) as String  ;
                                          print(value?.format(context));
                                        }
                                      }).catchError((error) =>  print(error.toString()) );
                                    },
                                    validate: (String? value){
                                      if(value!.isEmpty){
                                        return "time must not be empty";
                                      }
                                      return null;
                                    },
                                    label: " Task time",
                                    prefixicon: Icons.watch_later_outlined,
                                    colorIcon: Colors.teal
                                ),
                                const SizedBox(height: 20,),
                                defaultTextField(
                                    controller: dateController,
                                    keyboard: TextInputType.datetime,
                                    isclickable: false,
                                    ontap: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.parse('2025-12-02')
                                      ).then((value) {
                                        print(DateFormat.yMMMd().format(value!));
                                        dateController.text=DateFormat.yMMMd().format(value);
                                      });
                                    },
                                    validate: (String? value){
                                      if(value!.isEmpty){
                                        return "date must not be empty";
                                      }
                                      return null;
                                    },
                                    label: " date time",
                                    prefixicon: Icons.calendar_today,
                                    colorIcon: Colors.teal
                                ),
                              ],
                            ),
                          ),
                        ),
                    ).closed.then((value) {
                      cubit.changeBottomSheetShown
                        (isShow: false,
                          icon: Icons.edit);
                    });
                    cubit.changeBottomSheetShown
                      (isShow: true,
                        icon: Icons.add);
                  }
                }),
            bottomNavigationBar:CurvedNavigationBar(
              backgroundColor:Colors.teal,
              index:  cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
                  },
              items: const [
                CurvedNavigationBarItem(
                  child: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.check_circle_outline_rounded),
                  label: 'Done',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
            body: ConditionalBuilder(
              builder:(context)=>cubit.Screen[cubit.currentIndex],
              condition:state is! AppGetDatabaseLoadingStates,
              fallback: (BuildContext context) {
                return const Center(child: CircularProgressIndicator());
                  },),
          );
        }) ,
      );
  }
}



