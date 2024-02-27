import 'package:flutter/material.dart';

import '../components/plan_button.dart';

class TaskWindow extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const TaskWindow({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return AlertDialog(
      backgroundColor: Color.lerp(primaryColor, Colors.white, 0.4),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Add new task',
              ),
              cursorColor: primaryColor,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PlanButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                  foregroundColor: primaryColor,
                  backgroundColor: Colors.white,
                ),
                PlanButton(
                  text: 'Save',
                  onPressed: onSave,
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
