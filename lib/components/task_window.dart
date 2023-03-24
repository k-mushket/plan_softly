import 'package:flutter/material.dart';

import '../components/plan_button.dart';

class TaskWindow extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  TaskWindow({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PlanButton(text: 'Save', onPressed: onSave),
                PlanButton(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}