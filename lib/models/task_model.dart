class TaskModel {
  String title;
  String? desc;
  String? img;
  String? date;
  String? time;
  TaskStatus status;

  TaskModel({
    required this.title,
    required this.desc,
    required this.img,
    required this.date,
    required this.time,
    this.status = TaskStatus.pending,
  });
  TaskModel copyWith({
    String? title,
    String? desc,
    String? date,
    String? time,
    String? img,
    TaskStatus? status,
  }) {
    return TaskModel(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      img: img ?? this.img,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }
}

enum TaskStatus { pending, updated, deleted }
