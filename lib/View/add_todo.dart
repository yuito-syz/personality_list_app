import 'package:flutter/material.dart';
import 'package:personality_list_app/Model/todo_model.dart';

class add_todo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<add_todo> {
  // todoモデルを用意
  late TodoModel todoItem;

  // テキストフィールドのコントローラー設定
  // コントローラーの宣言
  late TextEditingController _todoInputController;

  // コントローラーの初期化
  void initState() {
    super.initState();
    _todoInputController = TextEditingController();
  }

  // statefulオブジェクトが削除されるときに、参照を削除してくれる
  void dispose() {
    super.dispose();
    _todoInputController.dispose();
  }

  // テキストの内容を渡しつつ画面遷移
  void _addTodo() {
    // 何かしらの入力があるときだけ実行
    if (_todoInputController.text.length > 0) {
      // 配列に入力値を追加
      todoItem = TodoModel(
        title: _todoInputController.text,
      );
      // テキストボックスを初期化
      _todoInputController.clear();
      Navigator.of(context).pop(todoItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    // scaffoldは画面構成の基本widget
    return Scaffold(
      // 背景色
      backgroundColor: Colors.teal[100],

      // アプリ上部のコンテンツ設定
      appBar: AppBar(
        title: Text("TODO追加"),
      ),

      // アプリのコンテンツ部分の設定
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _todoInputController,
                maxLength: 8,
                decoration: const InputDecoration(
                  labelText: 'TODO title',
                  hintText: '入力してください',
                  icon: Icon(Icons.done),
                ),
                autofocus: true,
                onEditingComplete: _addTodo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 0.0, bottom: 30.0, left: 0.0),
              child: ElevatedButton(
                child: Text('保存'),
                onPressed: _addTodo,
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}