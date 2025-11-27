import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_app/core/validation.dart';
import 'package:music_app/models/task_model.dart';
import 'package:image_picker/image_picker.dart';

class AddTaskForm extends StatefulWidget {
  final Function(TaskModel) onAdd;
  final TaskModel? existingTask;
  const AddTaskForm({super.key, required this.onAdd, this.existingTask});

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

  Future<void> _pickDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2100),
    );
    if (pickDate != null) {
      _dateController.text =
          "${pickDate.day}/${pickDate.month}/${pickDate.year}";
    }
    setState(() {});
  }

  Future<void> _pickTime() async {
    TimeOfDay? pickTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickTime != null) {
      _timeController.text = "${pickTime.hour}:${pickTime.minute}";
    }
  }

  String? imageErrorText;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final imageError = Validation.imageValidation(_imageFile);
      if (imageError != null) {
        imageErrorText = imageError;
        return;
      }

      final newTask = TaskModel(
        title: _titleController.text,
        desc: _descController.text,
        time: _timeController.text,
        date: _dateController.text,
        img: _imageFile?.path,
      );
      if (widget.existingTask != null) {
        // final w = widget.existingTask;
        // w!.status = TaskStatus.updated;
        // w.title = _titleController.text;
        // w.desc = _descController.text;
        // w.time = _timeController.text;
        // w.date = _dateController.text;
        TaskModel updatedTask = newTask.copyWith(status: TaskStatus.updated);
        widget.onAdd(updatedTask);
      } else {
        widget.onAdd(newTask);
      }
      setState(() {});
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
              validator: Validation.titleValidation,
            ),
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(labelText: "Description"),
              validator: Validation.descValidation,
            ),
            TextFormField(
              controller: _timeController,
              readOnly: true,
              decoration: InputDecoration(labelText: "Time"),
              validator: Validation.timeValidation,
              onTap: _pickTime,
            ),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(labelText: "Date"),
              validator: Validation.dateValidation,
              onTap: _pickDate,
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
            if (imageErrorText != null)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  imageErrorText!,
                  style: TextStyle(color: Colors.red),
                ),
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
