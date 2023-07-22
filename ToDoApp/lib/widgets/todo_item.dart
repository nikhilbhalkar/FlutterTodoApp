import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeletrItem;
  const ToDoItem({Key? key,required this.todo, required this.onToDoChanged, required this.onDeletrItem,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),

      child: ListTile(
        onTap: (){
          onToDoChanged(todo);

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(todo.isDone? Icons.check_box: Icons.check_box_outline_blank,color: Colors.deepPurpleAccent,),
        title: Text(todo.todoText!,style: TextStyle(fontSize: 16,
          color: Colors.black,
          decoration: todo.isDone? TextDecoration.lineThrough:null,),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeletrItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
