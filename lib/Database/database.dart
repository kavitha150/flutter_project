import 'package:hive/hive.dart';

class TodoDatabase{
  List TodoList=[];

  final _mybox=Hive.box('mybox');


  //we have defined here what are action perform
  void createData(){
    List TodoList=[
      ["Todo",false],
      ["Todo",false],
      ["Todo",false],



    ];

  }

  void loadData(){
    TodoList=_mybox.get("TodoList");

  }

  void updateDataBase(){
    _mybox.put("TodoList",TodoList );
  }
}
