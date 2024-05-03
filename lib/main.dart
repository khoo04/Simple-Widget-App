import 'package:flutter/material.dart';
import 'package:simple_widget_app/page/mainpage.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, //Disable Debug Banner
      home: home,
    );
  }
}
