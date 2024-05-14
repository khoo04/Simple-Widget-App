import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/widget/alertBox.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  TextEditingController amountController = TextEditingController();

  void textFormat(String? value) async {
    await Future.delayed(Duration(milliseconds: 1));
    if (value == null || value == "") {
      setState(() {
        amountController.text = "RM 0.00";
      });
      return;
    }
    //complete the following function, the format must be "RM x.xx", for example "RM 123.34"
    //the new value should push to the current value (can refer tng ewallet)
    // u can use keyboardType: TextInputType.number, to restrict the user input

    String extractedNumber = value.replaceAll(RegExp('[^0-9]'), '');

    if (extractedNumber.length >= 2) {
      //If number length is have more than 2 places, add the '.'
      extractedNumber =
          "${extractedNumber.substring(0, extractedNumber.length - 2)}.${extractedNumber.substring(extractedNumber.length - 2)}";
    } else {
      extractedNumber = "0.${extractedNumber.padLeft(2, '0')}";
    }
    //Replace 0 for start of line
    extractedNumber = extractedNumber.replaceFirst(RegExp('0'), '');

    //If the number string start with . , add 0 in front
    if (extractedNumber.startsWith(".")) {
      extractedNumber = '0${extractedNumber}';
    }

    setState(() {
      amountController.text = "RM ${extractedNumber}";
    });
  }

//the function that will validate your input, dont change it
  bool formatValidation(String value) {
    if (!value.startsWith('RM ')) {
      return false;
    } else if (value.length - value.lastIndexOf('.') != 3) {
      final num = value.lastIndexOf('.');
      return false;
    }
    String testValue = value.replaceFirst("RM", "");
    testValue = testValue.replaceFirst(".", "");
    testValue = testValue.replaceAll(" ", "");
    if (int.tryParse(testValue) == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Please Filled in the amount"),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: amountController,
                  onChanged: textFormat,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FilledButton(
                  onPressed: () {
                    final result = formatValidation(amountController.text);
                    if (result) {
                      displayAlert(
                          context, "Congratulation", "You pass the test");
                    } else {
                      displayAlert(context, "Sorry", "You fail the test");
                    }
                  },
                  child: Text("Validate Result"))
            ],
          ),
        ),
      ),
    );
  }
}
