import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvPage extends StatefulWidget {
  const EnvPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EnvPage> createState() => _EnvPagePageState();
}

class _EnvPagePageState extends State<EnvPage> {
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
            const Text('envのサンプル'),
            const Text('API_KEY'),
            Text(
              dotenv.env['API_KEY'] ?? "null",
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
            const Text('PASS_WORD'),
            Text(
              dotenv.get("PASS_WORD"),
              style: const TextStyle(fontSize: 18, color: Colors.blue),
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
