import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoItem extends StatelessWidget {
  final bool isChecked;
  final String todoText;

  final Function(bool?)? onChanged;
  final Function(BuildContext)? onPressed;

  TodoItem({super.key,
    required this.isChecked,
    required this.todoText,
    required this.onChanged,
    required  this.onPressed
  }
      );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10), //top
      child: Slidable(
        endActionPane: ActionPane(  // delete slidable
            motion: const StretchMotion(),
            children: [
              SlidableAction(onPressed:onPressed,
                icon: Icons.delete,
                backgroundColor: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(12),

              )
            ]
        ),
        child: Container(
          padding: const EdgeInsets.all(24), //middle
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(value: isChecked, onChanged: onChanged,),
              Text(todoText ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 19,color: Colors.white
                  ,decoration: isChecked?    // cross text
                  TextDecoration.lineThrough
                      :TextDecoration.none   // else
              ),)

            ],),
        ),
      ),
    );
  }
}
