import 'package:flutter/material.dart';
import 'package:todolist/counter_bloc.dart';
import 'package:todolist/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/presentation/button_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: App(),
    )
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var todos = [];
  String input = "";
  // final _bloc = ButtonBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                title: const Text("add todo"),
                content: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        todos.add(input);
                        Navigator.pop(context);
                      });
                    },
                    child: Text("add"),
                  )
                ],
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(todos[index]),
                    child: Card(
                      elevation: 8,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: ListTile(
                        title: Text(todos[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

