import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/widget/SquareButton.dart';

class ButtonAlignmentPage extends StatefulWidget {
  const ButtonAlignmentPage({super.key});

  @override
  State<ButtonAlignmentPage> createState() => _ButtonAlignmentPageState();
}

class _ButtonAlignmentPageState extends State<ButtonAlignmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: SquareButton(text: 'Button1')),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: SquareButton(text: 'Button1')),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: SquareButton(text: 'Button1')),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: SquareButton(text: 'Button1')),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: SquareButton(text: 'Button1')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //Fixed Button
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple,
        ),
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
          color: Colors.white,
        ),
      ),
    );
  }
}
