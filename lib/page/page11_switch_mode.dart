import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_widget_app/provider/theme_provider.dart';

class SwitchModePage extends StatefulWidget {
  const SwitchModePage({super.key});

  @override
  State<SwitchModePage> createState() => _SwitchModePageState();
}

class _SwitchModePageState extends State<SwitchModePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Dark Mode"),
          Switch(
              value: context.watch<ThemeProvider>().isDarkMode,
              onChanged: (value) {
                context.read<ThemeProvider>().changeTheme(value);
              }),
        ],
      ),
    );
  }
}
