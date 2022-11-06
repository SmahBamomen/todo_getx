
import 'package:flutter/material.dart';
import 'package:todo_getx/constants/colors.dart';
import 'package:todo_getx/control/app_controller.dart';
import 'package:todo_getx/view/add_task.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
class TodayTasks extends StatefulWidget {
  const TodayTasks({Key? key}) : super(key: key);

  @override
  State<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {
  TextEditingController taskNameController = new TextEditingController();
  DateTime newDate = DateTime.now();
  var formatterDate ;
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
                        // leading: Icon(
                        //     snapshot.data!.docs[index].data()["isDone"] ? Icons.check_box : Icons.check_box_outline_blank,
                        //     color: colorLightGreen
                        // ),
                        title: Text(
                          '${todoController.tasks[index]}',
                          style: TextStyle(
                            fontSize: 16,
                            color: colorBlack,
                            //   decoration: snapshot.data!.docs[index].data()["isDone"] ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
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
                                                controller: taskNameController,

                                                autofocus: true,
                                                decoration: InputDecoration(hintText: '${todoController.tasks[index]}',hintStyle: TextStyle(fontSize: 10)),

                                              ),


                                            ],
                                          ),

                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            }, child: Text('Cancel',style: TextStyle(color: colorGrey),)),
                                            TextButton(onPressed: (){
                                              todoController.editTodo(index, taskNameController.text);

                                              Navigator.of(context).pop();
                                            }, child: Text('Edit'))
                                          ],
                                        );;
                                      });

                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
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
                                        todoController.deleteTodo(index);

                                        Navigator.of(context).pop();
                                      }, child: Text('Yes'))
                                    ],
                                  ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            }


        ));
    return ListView.builder(
        shrinkWrap: true,
        itemCount: todoController.tasks.length,
        itemBuilder: (BuildContext context, int index) {
return Obx(()=>
    Dismissible(
        key: Key(index.toString()),
        child: Card(
          elevation: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            child:ListTile(
              onTap: () {

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
              // leading: Icon(
              //     snapshot.data!.docs[index].data()["isDone"] ? Icons.check_box : Icons.check_box_outline_blank,
              //     color: colorLightGreen
              // ),
              title: Text(
                '${todoController.tasks[index]}',
                style: TextStyle(
                  fontSize: 16,
                  color: colorBlack,
                  //   decoration: snapshot.data!.docs[index].data()["isDone"] ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
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
                                      controller: taskNameController,

                                      autofocus: true,
                                      decoration: InputDecoration(hintText: '${todoController.tasks[index]}',hintStyle: TextStyle(fontSize: 10)),

                                    ),


                                  ],
                                ),

                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: Text('Cancel',style: TextStyle(color: colorGrey),)),
                                  TextButton(onPressed: (){
                                    todoController.editTodo(index, taskNameController.text);

                                    Navigator.of(context).pop();
                                  }, child: Text('Edit'))
                                ],
                              );;
                            });

                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
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
                              todoController.deleteTodo(index);

                              Navigator.of(context).pop();
                            }, child: Text('Yes'))
                          ],
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
);
        }


    );;
  }
  Future openAddDialog() =>
      showDialog(context: context, builder: (context) => AddTask());
}
