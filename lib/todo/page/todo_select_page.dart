import 'package:emotrack/db/db.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TodoSelectPage extends StatelessWidget {
  const TodoSelectPage({super.key});

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
                  .map((e) => ListTile(title: Text(e.title)))
                  .toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
