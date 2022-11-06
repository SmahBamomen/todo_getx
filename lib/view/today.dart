
import 'package:flutter/material.dart';
import 'package:todo_getx/constants/colors.dart';
import 'package:todo_getx/control/app_controller.dart';
import 'package:todo_getx/view/add_task.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:todo_getx/view/delete_task.dart';
import 'package:todo_getx/view/edit_task.dart';
class TodayTasks extends StatefulWidget {
  const TodayTasks({Key? key}) : super(key: key);

  @override
  State<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {


  String errorText = '';
  var errorIcon;
  var todoController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        ListView.builder(
            shrinkWrap: true,
            itemCount: todoController.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(index.toString()),
                  child: Card(
                    elevation: 1,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child:ListTile(
                        onTap: () {
                          if (todoController.tasksDone[index] == false){
                            todoController.taskDone(index,true);
                          }
                          else {
                            todoController.taskDone(index,false);
                          }

                          setState(() {

                            // if  ( snapshot.data!.docs[index].data()["isDone"] == false ){
                            //   DocumentReference documentReference =
                            //   FirebaseFirestore.instance.collection("tasks").doc(snapshot.data!.docs[index].id);
                            //   documentReference.update({"isDone": true});
                            // }
                            // else {
                            //   DocumentReference documentReference =
                            //   FirebaseFirestore.instance.collection("tasks").doc(snapshot.data!.docs[index].id);
                            //   documentReference.update({"isDone": false});
                            // }

                          });

                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        tileColor: Colors.white,
                        leading: Icon(
                            todoController.tasksDone[index] ? Icons.check_box : Icons.check_box_outline_blank,
                            color: colorLightGreen
                        ),
                        title: Text(
                          '${todoController.tasks[index]}',
                          style: TextStyle(
                            fontSize: 16,
                            color: colorBlack,
                           decoration:  todoController.tasksDone[index] ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EditTask(index: index),
                            SizedBox(width: 10),
                            DeleteTask(index:index)
                          ],
                        ),
                      ),
                    ),
                  ));
            }


        ));

  }

}
