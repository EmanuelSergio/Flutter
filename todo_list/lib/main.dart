import 'package:flutter/material.dart';
import 'package:todo_list/main_page.dart';
import 'package:todo_list/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Opcional, para Material 3
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
