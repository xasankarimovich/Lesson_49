import 'package:flutter/material.dart';
import '../../controller/notes_controller.dart';
import '../../models/todo_model.dart';
import 'delete_dilalog.dart';

class NotesWidgets extends StatelessWidget {
  final NotesModel model;
  final int i;
  final NotesController notesController;
  VoidCallback onDeleted;
  NotesWidgets({
    required this.model,
    required this.i,
    required this.notesController,
    required this.onDeleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            model.title,
            style: const TextStyle(
              decorationColor: Colors.black,
              decorationThickness: 2,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(model.subtitle),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DeleteDialog(onDeleted: () {
                    notesController.deletePlan(i);
                    onDeleted();
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}