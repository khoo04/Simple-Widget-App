import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_widget_app/model/item.dart';
import 'package:simple_widget_app/widget/todolistTile.dart';

enum FilterOptions { all, completed, uncompleted }

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage> {
  List<Item>? items;

  @override
  void initState() {
    super.initState();
    getItemList();
  }

  FilterOptions selectedFilter = FilterOptions.all;

  Future<void> getItemList() async {
    final prefs = await SharedPreferences.getInstance();
    final itemJson = prefs.getString("items");
    if (itemJson == null) {
      String jsonString = await rootBundle.loadString('lib/assets/item.json');
      List json = jsonDecode(jsonString) as List<dynamic>;
      List<Item> itemList = json.map((e) => Item.fromJson(e)).toList();
      items = itemList;
    } else {
      List itemList = json.decode(itemJson) as List<dynamic>;
      items = itemList.map((e) => Item.fromJson(e)).toList();
    }

    //await Future.delayed(Duration(seconds: 10)); //For testing circular progress indicator
    setState(() {}); //Refresh the page when the items is loaded
  }

  void updateStatus(String name, bool completeStatus) async {
    items = items!.map((item) {
      if (item.name == name) {
        return Item(name: item.name, completeStatus: completeStatus);
      }
      return item;
    }).toList();
    final prefs = await SharedPreferences.getInstance();
    List itemMap = items!.map((e) => e.toJson()).toList();
    String jsonString = json.encode(itemMap);
    prefs.setString("items", jsonString);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              RadioListTile<FilterOptions>(
                title: Text('All'),
                value: FilterOptions.all,
                groupValue: selectedFilter,
                onChanged: (FilterOptions? value) {
                  setState(() {
                    selectedFilter = value!;
                  });
                },
              ),
              RadioListTile<FilterOptions>(
                title: Text('Completed'),
                value: FilterOptions.completed,
                groupValue: selectedFilter,
                onChanged: (FilterOptions? value) {
                  setState(() {
                    selectedFilter = value!;
                  });
                },
              ),
              RadioListTile<FilterOptions>(
                title: Text('Uncompleted'),
                value: FilterOptions.uncompleted,
                groupValue: selectedFilter,
                onChanged: (FilterOptions? value) {
                  setState(() {
                    selectedFilter = value!;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: items == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _buildList(selectedFilter),
          ),
        ],
      ),
    );
  }

  ListView _buildList(FilterOptions selectedFilter) {
    if (selectedFilter == FilterOptions.all) {
      return ListView.builder(
          itemCount: items!.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoListTile(
              item: items![index],
              parentState: this,
            );
          });
    } else if (selectedFilter == FilterOptions.completed) {
      List filteredList = items!.where((item) => item.completeStatus).toList();
      return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoListTile(
              item: filteredList[index],
              parentState: this,
            );
          });
    } else {
      List filteredList = items!.where((item) => !item.completeStatus).toList();
      return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoListTile(
              item: filteredList[index],
              parentState: this,
            );
          });
    }
  }
}
