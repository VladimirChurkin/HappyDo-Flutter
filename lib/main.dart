import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO on Flutter',
        theme: ThemeData(
          primarySwatch: Colors.red
        ),
        home: TodoList()
    );
  }
}


class TodoList extends StatefulWidget{


  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList>{
  List<String> tasks = new List<String>();

  void addTask(String task){
    if(task.length > 0) {
      setState(() => tasks.add(task.trim()));
    }
  }

  Widget buildTasks() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < tasks.length) {
          return buildTasksItem(tasks[index]);
        }
      },
    );
  }

  Widget buildTasksItem(String task_text){
    return new ListTile(
        title: Text(task_text.toString())
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('TODO List'),
      ),
      body: buildTasks(),
      floatingActionButton: FloatingActionButton(
        onPressed: addTaskScreen,
        tooltip: 'Add Task',
        child: new Icon(Icons.add)
      ),

    );
  }

  void addTaskScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context){
            return Scaffold(
              appBar: AppBar(
                title: Text('Add task'),
              ),
              body: TextField(
                autofocus: true,
                onSubmitted: (val){
                  addTask(val);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  hintText: "add task",
                  contentPadding: const EdgeInsets.all(16.0)

              ),
              )
            );

    }
    )
    );}
}
