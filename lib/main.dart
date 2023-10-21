import 'dart:async';

import 'package:emotrack/constants.dart';
import 'package:emotrack/db/db.dart';
import 'package:emotrack/todo/page/todo_select_page.dart';
import 'package:emotrack/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton(AppDatabase());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {kRouteTodoSelect: (context) => const TodoSelectPage()},
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? _timer;
  String _strDate = '';
  String _strTime = '';

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), () {
      final now = DateTime.now();
      setState(() {
        _strDate = toChineseDateStr(now);
        _strTime = toTimeStr(now);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  onMustDoClicked() {
    Navigator.pushNamed(context, kRouteTodoSelect);
  }

  onGoodThingClicked() {
    Navigator.pushNamed(context, kRouteTodoSelect);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(kAppName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_strDate),
            const SizedBox(height: 12),
            Text(_strTime),
            const SizedBox(height: 60),
            const Text('必做之事'),
            TextButton(onPressed: onMustDoClicked, child: const Text('选择')),
            const SizedBox(height: 48),
            const Text('美好之事'),
            TextButton(onPressed: onGoodThingClicked, child: const Text('选择')),
            const SizedBox(height: 48),
            ElevatedButton(onPressed: () => null, child: const Text('待做事项'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
