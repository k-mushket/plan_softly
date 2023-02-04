import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/plan_tile.dart';
import '../components/task_window.dart';
import '../data/database.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _theBox = Hive.box('box');
  PlanDataBase db = PlanDataBase();

  @override
  void initState() {
    if (_theBox.get('PLANLIST') == null) {
      db.createData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.planList[index][1] = !db.planList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.planList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskWindow(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.planList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: db.planList.length,
        itemBuilder: (BuildContext context, int index) {
          return PlanTile(
            taskName: db.planList[index][0],
            taskCompleted: db.planList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (p0) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
      ),
    );
  }
}
