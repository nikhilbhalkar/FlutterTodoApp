import 'package:flutter/material.dart';
import 'package:todoapp/splash_screen.dart';
import 'package:todoapp/widgets/todo_item.dart';
import 'package:todoapp/model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home:  Splash_screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo=[];
  final _todoController = TextEditingController();
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  void _runFilter(String enteredKeyword){
     List<ToDo> result = [];
     if (enteredKeyword.isEmpty)
       {
         result= todosList;
       }
     else{
       result = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
     }
     setState(() {
       _foundToDo = result;
     });
  }

  void _handleToDoChange(ToDo todo)
  {
    setState(() {
      todo.isDone = !todo.isDone;
    });


  }
  void _deleteToDoItem(String id)
  {
    setState(() {
      todosList.removeWhere((item) => item.id==id);
    });
}
void _addToDoItem(String toDo)
{
  setState(() {
    todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo,));
  });
  _todoController.clear();
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

          elevation: 0,
          title:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.menu,color: Colors.black,size: 30,),
              Container(
                height: 40,
                width: 280,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value)=> _runFilter(value),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      minWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),

                ),

              ),
              Container(
                height: 40,
                width: 40,

                child:ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child:Icon(Icons.person,color: Colors.black,),
                ) ,

              ),
            ],
          ),
      ),
      body: Container(
         color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 50,bottom: 20),
                    child: Text('Activity',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                  ),
                  for( ToDo todo in _foundToDo)
                    ToDoItem(todo: todo,
                    onToDoChanged: _handleToDoChange,
                    onDeletrItem: _deleteToDoItem,),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    
                    margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0.0,0.0), blurRadius: 10.0,spreadRadius: 0.0,),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add new todo Item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),),
                  Container(

                    margin: EdgeInsets.only(bottom: 20,right: 20),
                    child: ElevatedButton(
                      child: Text('+',style: TextStyle(fontSize: 40),),
                      onPressed: (){
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
