import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            height: 300,
                            child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("This is an bottom sheet")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text("Close"))
                                      ],
                                    )
                                  ],
                                )),
                          ))
                },
            child: Text("Show Modal Bottom Sheet")),
      ),
    );
  }
}
