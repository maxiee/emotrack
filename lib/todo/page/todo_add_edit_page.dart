import 'package:drift/drift.dart' as drift;
import 'package:emotrack/db/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';

class TodoAddEditPage extends StatefulWidget {
  const TodoAddEditPage({super.key});

  @override
  State<TodoAddEditPage> createState() => _TodoAddEditPageState();
}

class _TodoAddEditPageState extends State<TodoAddEditPage> {
  static const kTitle = 'title';
  static const kContent = 'content';
  static const kFinish = 'finish';

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
    _formKey.currentState?.saveAndValidate();
    final value = _formKey.currentState?.value;
    if (value == null) {
      return;
    }
    if (isEdit()) {
      onUpdateTodo(value);
    } else {
      onAddNewTodo(value);
    }
  }

  onAddNewTodo(Map<String, dynamic> value) {
    final todoData = TodoCompanion.insert(
        title: value[kTitle] ?? '',
        content: drift.Value(value[kContent] ?? ''),
        finish: drift.Value(value[kFinish] ?? false));
    GetIt.I
        .get<AppDatabase>()
        .createOrUpdateTodo(todoData)
        .then((newId) => Navigator.pop(context, newId));
  }

  onUpdateTodo(Map<String, dynamic> value) {
    final todoData = TodoCompanion.insert(
        id: drift.Value(todo!.id),
        title: value[kTitle] ?? '',
        content: value[kContent] ?? '',
        finish: value[kFinish] ?? false,
        created: drift.Value(todo!.created));
    GetIt.I
        .get<AppDatabase>()
        .createOrUpdateTodo(todoData)
        .then((newId) => Navigator.pop(context, newId));
  }

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
                name: kTitle,
                initialValue: todo?.title ?? ''),
            FormBuilderCheckbox(name: kFinish, title: const Text('完成')),
            FormBuilderTextField(
                decoration: const InputDecoration(labelText: '描述'),
                name: kContent,
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
