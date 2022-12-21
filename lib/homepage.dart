// ignore_for_file: depend_on_referenced_packages
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'todoContent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List coTodos = <dynamic>[];

  var formKey= GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCoTodos();
  }

  Future<void> getCoTodos() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await http.get(Uri.parse(url));

    setState(() {
      coTodos = convert.jsonDecode(response.body) as List<dynamic>;
    });

    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.edit_calendar),
        title: const Text('Co | Semi Final : Get Request'),
      ),

      body: ListView.builder(
          itemCount: coTodos.length,
          itemBuilder: (context, index){
            return Dismissible(
                key: ValueKey(coTodos[index]),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection direction){
                  setState(() {
                    coTodos.removeAt(index);
                  });
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(coTodos[index]['id'].toString()),
                    subtitle: Text(coTodos[index]['title'].toString()),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TodoContent(coTodo: coTodos[index])
                          )
                      );
                    },
                  ),
                )
            );
          }
      ),
    );
  }
}
