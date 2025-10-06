class TaskModel {
  String title;
  String? desc;
  String? img;
  String? date;
  String? time;
  TaskStatus status;

  TaskModel({
    required this.title,
    this.desc,
    this.img,
    this.date,
    this.time,
    this.status = TaskStatus.pending,
  });
}

enum TaskStatus { pending, done, deleted }
