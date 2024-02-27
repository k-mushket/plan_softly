import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:plan_softly/providers/theme_provider.dart';
import 'package:plan_softly/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('box');
  await Hive.openBox('settingsBox');
  
  var settingsBox = Hive.box('settingsBox');
  int? colorValue = settingsBox.get('themeColor');
  Color initialColor = colorValue != null ? Color(colorValue) : Colors.blue;

  runApp(App(initialColor: initialColor));
}

class App extends StatelessWidget {
  const App({super.key, required this.initialColor});

  final Color initialColor;
  static const appTitle = 'PlanSoftly';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(initialColor: initialColor),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appTitle,
            theme: ThemeData(
              primaryColor: themeProvider.themeColor,
              fontFamily: 'Quicksand',
            ),
            home: const HomePage(title: appTitle),
          );
        },
      ),
    );
  }
}
