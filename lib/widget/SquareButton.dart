import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({super.key, required this.text});
   final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
        ),
      ),
      child: Container(
        width: 70, // Adjust width as needed
        height: 70, // Adjust height as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.payment_rounded,
              color: Color(0xFF5465FF),
              size: 32,
            ),
            SizedBox(height: 8), // Adjust spacing between icon and text
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, // Adjust text size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
