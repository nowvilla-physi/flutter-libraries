import 'package:flutter/material.dart';
import 'package:flutter_libraries/flutter_screenutil.dart';
import 'package:flutter_libraries/shared_preferences.dart';

import 'next.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const MyHomePage(title: 'initial page'),
        '/next/page': (BuildContext context) =>
            const NextPage(title: 'Nextページ'),
        '/shared_preferences': (BuildContext context) =>
        const SharedPreferencesPage(title: 'shared_preferences'),
        '/flutter_screenutil': (BuildContext context) =>
        const FlutterScreenUtilPage(title: 'flutter_screenutil'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            const Text('初期画面'),
            OutlinedButton(
              child: const Text('次の画面へ'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/next/page');
              },
            ),
            OutlinedButton(
              child: const Text('shared_preferencesのサンプルへ'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/shared_preferences');
              },
            ),
            OutlinedButton(
              child: const Text('flutter_screenutilのサンプルへ'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/flutter_screenutil');
              },
            ),
          ],
        ),
      ),
    );
  }
}
