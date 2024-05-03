import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/page/page1_TNC.dart';
import 'package:simple_widget_app/page/page2_DateTime.dart';
import 'package:simple_widget_app/page/page3_payment.dart';
import 'package:simple_widget_app/page/page4_todolist.dart';
import 'package:simple_widget_app/page/page5_buttonAlign.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget? content;
  String title = 'Flyout Layout Example';
  String? name;
  int? age;
  bool isButtonVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = null;
                  title = "Flyout Layout Example";
                });
              },
            ),
            ListTile(
              title: Text('Term And Condition'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = TermAndConditionPage();
                  title = "Term And Condition";
                });
              },
            ),
            ListTile(
              title: Text('DateTime'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = DateTimePage();
                  title = "Date Validation";
                });
              },
            ),
            ListTile(
              title: Text('Text Formatting'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = AmountPage();
                  title = "Price Formatting";
                });
              },
            ),
            ListTile(
              title: Text('To Do List'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = ToDoListPage();
                  title = "To Do List";
                });
              },
            ),
            ListTile(
              title: Text('Button Alignment'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = ButtonAlignmentPage();
                  title = "Button Alignment";
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: (content == null)
            ? Visibility(
                visible: isButtonVisible,
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Provide your information"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: 'Name'),
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                                TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: 'Age'),
                                  onChanged: (value) {
                                    setState(() {
                                      age = int.tryParse(value);
                                    });
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (name != null && age != null) {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      isButtonVisible = false;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please fill all fields.'),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    "Please provide\nyour information",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              )
            : content,
      ),
    );
  }
}
