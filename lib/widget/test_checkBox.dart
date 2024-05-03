import 'package:flutter/material.dart';

class testCheckBox extends StatefulWidget {
  const testCheckBox({super.key});

  @override
  State<testCheckBox> createState() => _testCheckBoxState();
}

class _testCheckBoxState extends State<testCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: (bool? value) {
        setState(() {
          value = value!;
        });
      },
      title: Text('Checkbox Example'),
    );
  }
}
