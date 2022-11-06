import 'package:flutter/material.dart';
import 'package:todo_getx/view/add_task.dart';
import 'package:todo_getx/view/today.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Today 🥳',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                SizedBox(width: 150),
                SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: openAddDialog,
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TodayTasks(),

        ],
      ),
    );
  }

  Future openAddDialog() =>
      showDialog(context: context, builder: (context) => AddTask());
}
