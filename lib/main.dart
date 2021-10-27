import 'package:flutter/material.dart';
import 'package:personality_list_app/View/todo_list.dart';
import 'package:personality_list_app/View/add_todo.dart';

// アプリの起動
void main() {
  runApp(MyApp());
}

// TOPページ起動
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY TODO',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => todo_list(),
        '/add': (_) => add_todo(),
      },
    );
  }
}