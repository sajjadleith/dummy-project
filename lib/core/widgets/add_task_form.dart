import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_app/models/task_model.dart';
import 'package:image_picker/image_picker.dart';

class AddTaskForm extends StatefulWidget {
  final Function(TaskModel) onAdd;
  final TaskModel? existingTask;
  AddTaskForm({super.key, required this.onAdd, this.existingTask});

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickeImage() async {
    final pickFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (pickFile != null) {
      setState(() {
        _imageFile = File(pickFile.path);
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newTask = TaskModel(
        title: _titleController.text,
        desc: _descController.text,
        time: _timeController.text,
        date: _dateController.text,
        img: _imageFile?.path,
      );
      if (widget.existingTask != null) {
        widget.onAdd(newTask);
      } else {
        widget.onAdd(newTask);
      }
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      _titleController.text = widget.existingTask!.title;
      _descController.text = widget.existingTask!.desc ?? "";
      _dateController.text = widget.existingTask!.date ?? "";
      _timeController.text = widget.existingTask!.time ?? "";
      if (widget.existingTask!.img != null) {
        _imageFile = File(widget.existingTask!.img!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
            if (_imageFile != null)
              Image.file(
                _imageFile!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickeImage,
              icon: Icon(Icons.photo),
              label: Text("Pick Image"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(
                widget.existingTask != null ? "Edit Task" : "Add Task",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
