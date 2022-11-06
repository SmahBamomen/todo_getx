
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class AppController extends GetxController{
  var tasks = [

  ].obs;
  var valuecontroller = TextEditingController();
  void addTodo(value){
    tasks.add(value);
    print("from add");
print(tasks.length);
  }

  void deleteTodo(index){
    tasks.removeAt(index);
    print("from delete");
    print(tasks.length);
  }

  void editTodo(index,value){
    tasks.removeAt(index);
    tasks.insert(index,value);
  }
}