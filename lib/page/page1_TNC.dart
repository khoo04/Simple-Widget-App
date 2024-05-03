import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TermAndConditionPage extends StatefulWidget {
  const TermAndConditionPage({super.key});

  @override
  State<TermAndConditionPage> createState() => _TermAndConditionPageState();
}

class _TermAndConditionPageState extends State<TermAndConditionPage> {
  bool isread = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "lib/assets/image1.png",
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Term And Condition",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.grey),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A lacus vestibulum sed arcu non odio euismod lacinia at. Arcu odio ut sem nulla pharetra. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Ipsum suspendisse ultrices gravida dictum. Viverra justo nec ultrices dui sapien eget mi. Faucibus vitae aliquet nec ullamcorper sit amet. Nullam non nisi est sit amet facilisis magna etiam. Eu consequat ac felis donec et odio pellentesque diam volutpat. Morbi tempus iaculis urna id volutpat.\nFermentum leo vel orci porta non pulvinar neque laoreet. Eros in cursus turpis massa. Porttitor lacus luctus accumsan tortor. Lorem donec massa sapien faucibus. Enim nunc faucibus a pellentesque sit amet porttitor. Pharetra et ultrices neque ornare aenean euismod elementum. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque. Leo duis ut diam quam. Non sodales neque sodales ut. Tortor dignissim convallis aenean et. In est ante in nibh mauris cursus mattis. Etiam tempor orci eu lobortis elementum nibh tellus molestie. Luctus venenatis lectus magna fringilla urna porttitor rhoncus. Dolor morbi non arcu risus quis varius. Pulvinar elementum integer enim neque volutpat ac. In hac habitasse platea dictumst vestibulum rhoncus est. Tincidunt praesent semper feugiat nibh sed. Tincidunt augue interdum velit euismod in pellentesque massa.",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isread,
                            onChanged: (val) {
                              setState(() {
                                isread = val!;
                              });
                            }),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("I have read all the term and condition"),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: isread
                            ? () {
                                print("Users have read T&C.");
                              }
                            : null,
                        style: (isread)
                            ? ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                              )
                            : null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            Text(
                              "Accept Term and Condtion",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
