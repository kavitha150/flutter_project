import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app1/utlis/dialog_box.dart';
import 'package:todo_app1/utlis/todo_item.dart';


import 'Database/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  final _mybox = Hive.box("mybox");
  //create database object
  TodoDatabase db = TodoDatabase();
  // load the database list
  @override
  void initState() {
    if (_mybox.get("Todolist") == null) {
      db.createData(); //first open it create
    } else {
      db.loadData(); //else it will load
    }

    super.initState();
  }

  //delete function
  void deleteTask(int index) {
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void marksAsDone(int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
      db.updateDataBase();
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.updateDataBase();
  } // correct  value

  void onChaged(bool? value) {
    setState(() {});
  }

  void saveNewTask() {
    setState(() {
      db.TodoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        // title have give
        title: const Text(
          "Todo App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan[400],
        elevation: 10, // brightness at top header back
      ),
      //button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.cyan[400],
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.TodoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            isChecked: db.TodoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            todoText: db.TodoList[index][0],
            onPressed: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
