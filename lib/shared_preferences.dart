import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  late int _count;
  final key = "count_key";

  @override
  void initState() {
    super.initState();
    _readCount();
  }

  void _readCount() async {
    // SharedPreferencesオブジェクトの取得
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // 端末に保存されているcountを取得する。なければ(null)0とする。
      _count = prefs.getInt(key) ?? 0;
    });
  }

  void _saveCount() async {
    // SharedPreferencesオブジェクトの取得
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // 端末に保存する
      _count = _count + 1;
      prefs.setInt(key, _count);
    });
  }

  void _deleteCounter() async {
    // SharedPreferencesオブジェクトの取得
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // countの初期化と保存されているデータを削除
      _count = 0;
      prefs.remove(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('shared_preferencesのサンプル'),
            const Text('カウント'),
            Text(_count.toString()),
            OutlinedButton(
              child: const Text('+1してデータ保存'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                _saveCount();
              },
            ),
            OutlinedButton(
              child: const Text('データ削除'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                _deleteCounter();
              },
            ),
            OutlinedButton(
              child: const Text('戻る'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
