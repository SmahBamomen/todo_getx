
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class AppController extends GetxController{
  var tasks = [
  ].obs;
  var tasksDone = [
  ].obs;
  var taskAddController =  TextEditingController();
  var taskEditController =  TextEditingController();
  void addTodo(value){
    tasks.add(value);
    tasksDone.add(false);
    taskAddController.clear();

  }


  void deleteTodo(index){
    tasks.removeAt(index);
    tasksDone.removeAt(index);
  }

void taskDone(index,isDone){
  tasksDone[index] = isDone;
}
  void editTodo(index,value){
    tasks[index] = value;
    taskEditController.clear();
    // tasks.removeAt(index);
    // tasks.insert(index,value);
  }
}