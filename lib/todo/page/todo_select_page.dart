import 'package:emotrack/constants.dart';
import 'package:emotrack/db/db.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TodoSelectPage extends StatelessWidget {
  const TodoSelectPage({super.key});

  onAddTodoClick(BuildContext context) {
    Navigator.pushNamed(context, kRouteTodoAdd).then((todoId) {
      if (todoId != null) {
        Navigator.pop(context, todoId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('选择事项'),
      ),
      body: FutureBuilder<List<TodoData>>(
        future: GetIt.I.get<AppDatabase>().allTodoItems,
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
              children: snapshot.data!
                  .map((e) => ListTile(
                      title: Text(e.title),
                      onTap: () => Navigator.pop(context, e.id)))
                  .toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAddTodoClick(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
