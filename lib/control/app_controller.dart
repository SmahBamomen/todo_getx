
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class AppController extends GetxController{
  var tasks = [
  ].obs;

  var taskAddController = new TextEditingController();
  var taskEditController = new TextEditingController();
  void addTodo(value){
    tasks.add(value);

  }

  void deleteTodo(index){
    tasks.removeAt(index);

  }

  void editTodo(index,value){
    tasks.removeAt(index);
    tasks.insert(index,value);
  }
}