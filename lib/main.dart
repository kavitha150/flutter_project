import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app1/home_page.dart';

void main()   async{
  await Hive.initFlutter();
  var box=await Hive.openBox("mybox");
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner:false,
      theme:ThemeData(primarySwatch: Colors.blue),
    );
  }
}
