
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:udemy/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:udemy/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:udemy/shared/cubit/states.dart';
import 'package:udemy/shared/network/local/cache_helper.dart';


class AppCubit extends Cubit<AppStates>{

  AppCubit(): super(AppInitialStates());
  static AppCubit? get(context)=> BlocProvider.of(context);


  List<Widget> Screen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title = [
    "New Task",
    "Done Task",
    "Archived Task",
  ];
  int currentIndex = 0;
  void changeIndex(int index){
   currentIndex=index;
   emit(AppChangeBottomNavBarStates());
  }

  late Database database;
  List<Map>? newTasks=[];
  List<Map>? doneTasks=[];
  List<Map>? archivedTasks=[];


  void createDatabase()  {
    openDatabase(
        'todo.db', version: 1,
        onCreate: (database, version) {
          print("db created");
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
              .then((value) => (value) {
            print("table create");
          })
              .catchError((e) {
            print("error when creating table ${e.toString()}");
          });
        }, onOpen: (database) {
          getDataFromDatabase(database);
          print("db opened");
        }).then((value) {
          
          database=value;
          emit(AppCreateDatabaseStates());
    });
  }

   insertDatabase({required String title,required String time,required String date})
  async {
     await database.transaction((txn)  {
     return txn.rawInsert(
          "INSERT INTO tasks(title,time,date,status)VALUES('$title','$time','$date','new')")
          .then((value) {
        if (value is FutureOr) {
          print("$value inserted success");
          emit(AppInsertDatabaseStates());

          getDataFromDatabase(database);

        }
      }).catchError((error) {
        print("error when inserted table ${error.toString()}");
      });
    });
    //return null;
  }

  void getDataFromDatabase(database){

    newTasks=[];
    doneTasks=[];
    archivedTasks=[];

    emit(AppGetDatabaseLoadingStates());
     database?.rawQuery("SELECT * FROM tasks").then((value) {

      
       value.forEach((element) {
         if(element['status']=='new'){
           newTasks?.add(element);
         }
        else if(element['status']=='done'){
           doneTasks?.add(element);
         } else{
           archivedTasks?.add(element);
         }


       });
       AppGetDatabaseStates();
       emit(AppGetDatabaseStates());

     });
  }

 void updateData({
  required String status,
    required int id
})async{
    database.rawUpdate(
  'UPDATE tasks SET status = ?  WHERE id = ?',
  [status, '$id']).then((value) {
      getDataFromDatabase(database);
    emit(AppUpdateDatabaseStates());

    });
}

     void deleteData({
       required var id
  })async{
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseStates());

    });


  }




  bool isBottomsheetshown = false;
  IconData fabicon = Icons.edit;

  void changeBottomSheetShown({
  required bool isShow,
  required IconData icon,
})
  {
    fabicon=icon;
    isBottomsheetshown=isShow;
    emit(AppChangeBottomSheetStates());

  }


  bool isDark=false;
  void changeMode({bool? fromShared}){
    if(fromShared != null){
      isDark =fromShared;
    }else {
      isDark =  !isDark;
    }
      CacheHelper.putBoolean(key: "isDark", value: isDark).
      then((value) {
        emit(AppChangeModeStates());
      });


  }


}