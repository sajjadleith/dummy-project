import 'package:flutter/material.dart';
import 'package:music_app/models/task_model.dart';

class AddTaskForm extends StatefulWidget {
  final Function(TaskModel) onAdd;
  AddTaskForm({super.key, required this.onAdd});

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newTask = TaskModel(
        title: _titleController.text,
        desc: _descController.text,
        time: _timeController.text,
        date: _dateController.text,
      );
      widget.onAdd(newTask);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
            validator: (value) =>
                value!.isEmpty ? "Please Enter the Title" : null,
          ),
          TextFormField(
            controller: _descController,
            decoration: InputDecoration(labelText: "Description"),
          ),
          TextFormField(
            controller: _timeController,
            decoration: InputDecoration(labelText: "Time"),
          ),
          TextFormField(
            controller: _dateController,
            decoration: InputDecoration(labelText: "Date"),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _submit, child: Text("Add Task")),
        ],
      ),
    );
  }
}
