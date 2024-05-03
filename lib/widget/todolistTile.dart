import 'package:flutter/material.dart';
import 'package:simple_widget_app/model/item.dart';
import 'package:simple_widget_app/page/page4_todolist.dart';

class ToDoListTile extends StatelessWidget {
  const ToDoListTile(
      {super.key, required this.item, required this.parentState});
  final Item item;
  final ToDoListPageState parentState;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
          color: item.completeStatus ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 75, // Adjust width as needed
            height: 75, // Adjust height as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://prim.my/assets/landing-page/img/header-yuran.png",
                ),
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
          Text(item.name,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
          Checkbox(
              value: item.completeStatus,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                parentState.updateStatus(item.name, value);
              })
        ],
      ),
    );
  }
}
