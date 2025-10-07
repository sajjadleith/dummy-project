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

  @override
  Widget build(BuildContext context) {
    final activeTasks = tasks
        .where((task) => task.status != TaskStatus.deleted)
        .toList();
    return Scaffold(
      body: activeTasks.isEmpty
          ? Center(child: Text("Please Add a Task"))
          : ListView.builder(
              itemCount: activeTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: activeTasks[index].img != null
                        ? Image.file(
                            File(activeTasks[index].img!),
                            width: 50,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.task),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(activeTasks[index].title),
                        Text(
                          activeTasks[index].time ?? "0:0",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(activeTasks[index].desc ?? ""),
                        Text(activeTasks[index].date ?? ""),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _editTask(activeTasks[index], index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteTask(activeTasks[index]),
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
