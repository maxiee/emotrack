import 'package:emotrack/db/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TodoAddEditPage extends StatefulWidget {
  const TodoAddEditPage({super.key});

  @override
  State<TodoAddEditPage> createState() => _TodoAddEditPageState();
}

class _TodoAddEditPageState extends State<TodoAddEditPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  TodoData? todo;

  bool isEdit() => todo != null;

  @override
  void initState() {
    super.initState();
    Future(() {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        todo = args as TodoData;
      }
    });
  }

  onClickSave() {
    if (isEdit()) {
      onUpdateTodo();
    } else {
      onAddNewTodo();
    }
  }

  onAddNewTodo() {}

  onUpdateTodo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEdit() ? const Text('编辑事项') : const Text('添加事项'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            if (isEdit()) Text('id: ${todo?.id ?? ''}'),
            FormBuilderTextField(
                decoration: const InputDecoration(labelText: '标题'),
                name: 'title',
                initialValue: todo?.title ?? ''),
            FormBuilderCheckbox(name: 'finish', title: const Text('完成')),
            FormBuilderTextField(
                decoration: const InputDecoration(labelText: '描述'),
                name: 'content',
                minLines: 3,
                maxLines: 6,
                initialValue: todo?.content ?? ''),
            if (isEdit()) Text('创建时间: ${todo?.created ?? ''}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onClickSave,
        tooltip: 'Increment',
        child: const Icon(Icons.save),
      ),
    );
  }
}
