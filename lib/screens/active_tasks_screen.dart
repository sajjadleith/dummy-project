import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_app/core/widgets/add_task_form.dart';
import 'package:music_app/models/task_model.dart';

class ActiveTasksScreen extends StatefulWidget {
  ActiveTasksScreen({Key? key}) : super(key: key);

  @override
  _ActiveTasksScreenState createState() => _ActiveTasksScreenState();
}

class _ActiveTasksScreenState extends State<ActiveTasksScreen> {
  List<TaskModel> tasks = [];
  // Add Task
  void _addTask(TaskModel task) {
    tasks.add(task);
    setState(() {});
  }

  // Delete Task
  void _deleteTask(TaskModel task) {
    task.status = TaskStatus.deleted;
    tasks.remove(task);
    setState(() {});
  }

  // Update Task

  void _editTask(TaskModel task, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: AddTaskForm(
            existingTask: task,
            onAdd: (updatedTask) {
              setState(() {
                tasks[index] = updatedTask;
              });
            },
          ),
        );
      },
    );
  }

  void _openAddTaskModel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: AddTaskForm(onAdd: _addTask),
        );
      },
    );
  }

  Color checkStatus(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Colors.white;
      case TaskStatus.updated:
        return Colors.greenAccent;
      case TaskStatus.deleted:
        return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tasks.isEmpty
          ? Center(child: Text("Please Add a Task"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                print(task.status);
                return Card(
                  color: checkStatus(task.status),
                  child: ListTile(
                    leading: task.img != null
                        ? Image.file(
                            File(task.img!),
                            width: 50,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.task),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(task.title),
                        Text(
                          task.time ?? "0:0",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(task.desc ?? ""), Text(task.date ?? "")],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _editTask(task, index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteTask(task),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskModel,
        child: Icon(Icons.add),
      ),
    );
  }
}
