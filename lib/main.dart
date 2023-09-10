
import 'package:flutter/material.dart';
import 'package:revoke_screenshots/core/utils/screen_record_shoot_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Prevent screenshot and screen records',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final ScreenRecordHandlerChannel screenRecordHandlerChannel = ScreenRecordHandlerChannel();

  @override
  void initState() {
    screenRecordHandlerChannel.preventScreenRecord();
    super.initState();
  }

  @override
  void dispose() {
    screenRecordHandlerChannel.disposePreventScreenRecord();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
