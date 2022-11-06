import 'package:flutter/material.dart';
import 'package:todo_getx/constants/colors.dart';
import 'package:todo_getx/control/app_controller.dart';
import 'package:get/get.dart';

class EditTask extends StatefulWidget {
  final int index;
  const EditTask({Key? key, required this.index}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  var todoEditController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: 35,
      decoration: BoxDecoration(
        color: colorBlack,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        color: colorWhite,
        iconSize: 18,
        icon: Icon(Icons.edit),
        onPressed: (){

          showDialog(context: context,
              barrierDismissible: true,
              builder: (BuildContext cxt) {
                return AlertDialog(

                  title: Center(child: Text("To Do List",style: TextStyle(fontWeight: FontWeight.w600,color: colorBlack),)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Task Name :',style: TextStyle(fontWeight: FontWeight.w600,color: colorLightGreen),),
                      TextField(
                        controller: todoEditController.taskEditController,

                        autofocus: true,
                        decoration: InputDecoration(hintText: '${todoEditController.tasks[widget.index]}',hintStyle: TextStyle(fontSize: 10)),

                      ),


                    ],
                  ),

                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('Cancel',style: TextStyle(color: colorGrey),)),
                    TextButton(onPressed: (){
                      todoEditController.editTodo(widget.index, todoEditController.taskEditController.text);

                      Navigator.of(context).pop();
                    }, child: Text('Edit'))
                  ],
                );;
              });

        },
      ),
    );
  }
}
