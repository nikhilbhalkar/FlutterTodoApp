import 'package:flutter/cupertino.dart';

class ToDo {
  String id;
  String todoText;
  bool isDone;

  ToDo(
  {
    required this.id,
    required this.todoText,
    this.isDone= false,

  }
  );
  static List<ToDo> todoList(){
    return[
      ToDo(id:'01',todoText: '1 Class',isDone: true),
      ToDo(id:'02',todoText: '2 Break Fast',isDone: true),
      ToDo(id:'03',todoText: '3 Flutter Project'),
      ToDo(id:'04',todoText: '4 JAVA Assignement'),
      ToDo(id:'05',todoText: '5 CPP Coding'),
      ToDo(id:'06',todoText: '6 Assignement',isDone: true),
    ];
  }
}