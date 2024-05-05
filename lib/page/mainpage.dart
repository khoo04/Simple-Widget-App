import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool isSubmited = false;
  bool acceptStatus = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<bool?> _getTNCStatus() async {
    final storage = await SharedPreferences.getInstance();
    acceptStatus = storage.getBool("tnc_status") ?? false;
    return acceptStatus;
  }

  void _updateTNCStatus(bool status) async {
    final storage = await SharedPreferences.getInstance();
    storage.setBool("tnc_status", status);
    setState(() {
      acceptStatus = status;
    });
  }

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
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = (!acceptStatus)
                      ? TermAndConditionPage(updateTNCStatus: _updateTNCStatus)
                      : _buildHomePage(context);
                  title = (!acceptStatus)
                      ? "Term And Condition"
                      : "Flyout Layout Example";
                });
              },
            ),
            ListTile(
              title: const Text('Term And Condition'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = acceptStatus
                      ? _buildHomePage(context)
                      : TermAndConditionPage(updateTNCStatus: _updateTNCStatus);
                  title = (acceptStatus)
                      ? "Flyout Layout Example"
                      : "Term And Condition";
                });
              },
            ),
            ListTile(
              title: const Text('DateTime'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const DateTimePage();
                  title = "Date Validation";
                });
              },
            ),
            ListTile(
              title: const Text('Text Formatting'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const AmountPage();
                  title = "Price Formatting";
                });
              },
            ),
            ListTile(
              title: const Text('To Do List'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const ToDoListPage();
                  title = "To Do List";
                });
              },
            ),
            ListTile(
              title: const Text('Button Alignment'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const ButtonAlignmentPage();
                  title = "Button Alignment";
                });
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _getTNCStatus(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool tncAccepted = snapshot.data ?? false;
            return tncAccepted
                ? content ?? _buildHomePage(context)
                : TermAndConditionPage(updateTNCStatus: _updateTNCStatus);
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return Center(
      child: isSubmited
          ? Text("Name : $name \nAge : $age")
          : OutlinedButton(
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
                              controller: nameController,
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Age'),
                              controller: ageController,
                              keyboardType: TextInputType.number,
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
                              name = nameController.text;
                              age = int.parse(ageController.text);
                              if (name != null && age != null) {
                                Navigator.of(context).pop();
                                setState(() {
                                  isSubmited = true;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill all fields.'),
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
    );
  }
}
