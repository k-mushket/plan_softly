import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlanTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  PlanTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.purple,
                onPressed: deleteFunction,
                icon: Icons.delete_outline,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple.shade300,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 15.0,
                  offset: Offset(-5, -5),
                  color: Color.fromARGB(255, 219, 143, 233),
                ),
                BoxShadow(
                  blurRadius: 15.0,
                  offset: Offset(5, 5),
                  color: Colors.purple,
                ),
              ],
            ),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.purple.shade600,
                ),
                Flexible(
                  child: Text(
                    taskName,
                    style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}