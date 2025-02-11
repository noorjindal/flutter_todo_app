import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Function(BuildContext)? deleteFunction;

  //constructor
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,

  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            )

          ],
        ),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12) ),
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
           //checkbox
            Checkbox(value: taskCompleted,
             onChanged: onChanged,
             activeColor: Colors.black),
             

            //task name
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted? TextDecoration.lineThrough: TextDecoration.none,
                
            ),
            ),
          ],
          
        ),
        ),
      
      ),
    );
  }
}