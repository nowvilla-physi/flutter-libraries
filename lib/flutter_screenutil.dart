import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterScreenUtilPage extends StatefulWidget {
  const FlutterScreenUtilPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<FlutterScreenUtilPage> createState() => _FlutterScreenUtilPageState();
}

class _FlutterScreenUtilPageState extends State<FlutterScreenUtilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScreenUtilInit(
        // デザイン原案におけるデバイス画面の大きさ(単位：dp)
        designSize: const Size(360, 690),
        builder: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'flutter_screenutilのサンプル',
                style: TextStyle(fontSize: 14.sp),
              ),
              Text(
                '画面のサイズによって適切に表示してくれます！',
                style: TextStyle(fontSize: 24.sp),
              ),
              Container(
                width: 180.w,
                height: 200.h,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'レスポンシブテスト画面',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
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
      ),
    );
  }
}
