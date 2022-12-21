import 'package:flutter/material.dart';

class TodoContent extends StatefulWidget {
  final dynamic coTodo;

  const TodoContent({
    required this.coTodo,
    Key? key
  }) : super(key: key);

  @override
  State<TodoContent> createState() => _TodoContentState();
}

class _TodoContentState extends State<TodoContent> {

  Widget listTileItem(String text, dynamic value) {
    return ListTile(
      title: Text(text),
      subtitle: Text(value.toString()),
      leading: const Icon(Icons.check_circle_outline),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Content Details:'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          listTileItem('Title: ', widget.coTodo['title']),

          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide()
                  )
              )
          ),

          listTileItem('ID: ', widget.coTodo['id']),

          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide()
                  )
              )
          ),

          listTileItem('User ID: ', widget.coTodo['userId']),

          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide()
                  )
              )
          ),

          listTileItem('Completed: ', widget.coTodo['completed']),

          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide()
                  )
              )
          ),
        ],
      ),
    );
  }
}

