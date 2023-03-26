import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('box');

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.purple.shade300,
      systemNavigationBarColor: Colors.purple.shade400,
    ),
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static const appTitle = 'PlanSoftly';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
      ),
      home: HomePage(title: appTitle),
    );
  }
}
