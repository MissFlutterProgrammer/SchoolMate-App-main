// ignore_for_file: prefer_typing_uninitialized_variables, file_names, camel_case_types

class Subject {
  var name;
  var description;
  Subject({this.name, this.description});
}

class lessonModel {
  var checked;
  var title;
  var id;
  var subjectid;

  lessonModel({this.title, this.checked, this.id, this.subjectid});
}

class MarksModel {
  var title;
  var mark;
  var fmark;

  MarksModel({this.title, this.mark, this.fmark});
}
