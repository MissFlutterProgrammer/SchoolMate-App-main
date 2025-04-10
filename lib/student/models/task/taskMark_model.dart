// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

class TaskMarkModel {
  final taskid;
  final classRoom_id;
  final student_id;
  late final StudenUploadDate;
  final urlFromFireStorge;
  late final mark;
  late final st_uploadDate;
  TaskMarkModel({
    this.taskid,
    this.StudenUploadDate,
    this.mark,
    this.student_id,
    this.classRoom_id,
    this.urlFromFireStorge,
  });
}
