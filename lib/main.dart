import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_widget_app/page/mainpage.dart';
import 'package:simple_widget_app/provider/theme_provider.dart';

void main() {
  runApp(const MyApp(
    home: MainPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.home});
  final Widget home;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvder, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          themeMode: themeProvder.currentTheme,
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false, //Disable Debug Banner
          home: home,
        ),
      ),
    );
  }
}
