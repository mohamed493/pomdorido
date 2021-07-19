import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './preferences/day_preference.dart';
import 'package:provider/provider.dart';
import 'MyHomePage.dart';
import 'home_page_web.dart';
import 'widgets/task_reminder_dialogue.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => Dialog2()),
      ], child: !kIsWeb? MyHomePage(title: 'Pomodroido'): MyHomePageWeb(title: 'Pomodroido')),
    );
  }
}
