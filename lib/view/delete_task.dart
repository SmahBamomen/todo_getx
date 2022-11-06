import 'package:flutter/material.dart';
import 'package:todo_getx/constants/colors.dart';
import 'package:todo_getx/control/app_controller.dart';
import 'package:get/get.dart';
class DeleteTask extends StatefulWidget {
  final int index;

  const DeleteTask({Key? key, required this.index}) : super(key: key);

  @override
  State<DeleteTask> createState() => _DeleteTaskState();
}

class _DeleteTaskState extends State<DeleteTask> {
  var todoDeleteController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: 35,
      decoration: BoxDecoration(
        color: colorRed,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        color: colorWhite,
        iconSize: 18,
        icon: Icon(Icons.delete),
        onPressed: (){

          showDialog(context: context, builder: (context) =>   AlertDialog(
            title: Text('Alert !! 🚨',style: TextStyle(color: colorRed)),
            content: Text('Are you sure to delete the task ? ',style: TextStyle(color: colorLightGreen)),

            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('No',style: TextStyle(color: colorGrey),)),
              TextButton(onPressed: (){
                todoDeleteController.deleteTodo(widget.index);

                Navigator.of(context).pop();
              }, child: Text('Yes'))
            ],
          ));
        },
      ),
    );
  }
}
