// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

class QuizzModel {
  var quiz_id;
  var subject_name;
  var question;
  var def;
  var name;

  QuizzModel({
    this.def,
    this.question,
    this.quiz_id,
    this.subject_name,
    this.name,
  });
}
