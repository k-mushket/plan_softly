import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plan_softly/providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  final Map<Color, String> colorNames = {
    Colors.blue: 'Blue',
    Colors.green: 'Green',
    Colors.red: 'Red',
    Colors.orange: 'Orange',
    Colors.purple: 'Purple',
  };

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.lerp(primaryColor, Colors.white, 0.3),
      body: ListView.builder(
        itemCount: colorNames.length,
        itemBuilder: (context, index) {
          Color color = colorNames.keys.elementAt(index);
          return ListTile(
            leading: Icon(Icons.circle, color: color),
            title: Text(
              colorNames[color] ?? 'Unknown',
            ),
            onTap: () {
              themeProvider.setThemeColor(color);
            },
          );
        },
      ),
    );
  }
}
