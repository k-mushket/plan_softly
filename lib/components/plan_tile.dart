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
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red.shade300,
              onPressed: deleteFunction,
              icon: Icons.delete_outline,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
            boxShadow: const [
              BoxShadow(
                blurRadius: 15.0,
                offset: Offset(-5, -5),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 15.0,
                offset: Offset(5, 5),
                color: Colors.grey,
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.grey.shade600,
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
    );
  }
}
