import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/widget/alertBox.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  String date1 = "Date1";
  String date2 = "Date2";

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<DateTime?> getDateInput() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());

    return date;
  }

  Future<TimeOfDay?> getTimeInput(TimeOfDay? oldInput) async {
    final time = await showTimePicker(
      context: context,
      //If oldInput does not exist use now instead
      initialTime: oldInput ?? TimeOfDay.now(),
    );
    return time;
  }

  String dateFormat(DateTime date) {
    String month =
        date.month.toString().padLeft(2, '0'); // Ensure two digits for month
    String day = date.day.toString().padLeft(2, '0');
    return "${date.year}-$month-$day";
  }

  int compareTimeOfDay(TimeOfDay time1, TimeOfDay time2) {
    if (time1.hour < time2.hour) {
      return -1;
    } else if (time1.hour > time2.hour) {
      return 1;
    } else {
      //If the hours is equal
      if (time1.minute < time2.minute) {
        return -1;
      } else if (time1.minute > time2.minute) {
        return 1;
      } else {
        //Time is equal
        return 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: double.infinity, // Expand to fill the width
                  height: 50,
                  child: const Text(
                    "Date Range",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final date = await getDateInput();
                    if (date == null) {
                      return;
                    }
                    if (date2 != "Date2") {
                      if (DateTime.parse(date2).isBefore(date)) {
                        displayAlert(
                          context,
                          "Alert",
                          "The start date cannot later than end date",
                        );
                        setState(() {
                          date1 = dateFormat(date);
                          date2 = dateFormat(date);
                        });
                      }
                    }
                    setState(() {
                      date1 = dateFormat(date);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      date1,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final date = await getDateInput();
                    if (date == null) {
                      return;
                    }
                    if (date1 != "Date1") {
                      if (DateTime.parse(date1).isAfter(date)) {
                        displayAlert(
                          context,
                          "Alert",
                          "The end date cannot earlier than start date",
                        );
                        setState(() {
                          date1 = dateFormat(date);
                          date2 = dateFormat(date);
                        });
                      }
                    }
                    setState(() {
                      date2 = dateFormat(date);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      date2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: double.infinity, // Expand to fill the width
                  height: 50,
                  child: const Text(
                    "Time Range",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getTimeInput(startTime);
                    if (time == null) {
                      return;
                    }
                    if (endTime != null) {
                      //If Time 2 is selected
                      if (compareTimeOfDay(endTime!, time) == -1) {
                        displayAlert(
                          context,
                          "Alert",
                          "The start time is later than end time",
                        );
                        setState(() {
                          startTime = time;
                          endTime = time;
                        });
                      }
                    }
                    setState(() {
                      startTime = time;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      startTime == null
                          ? "Start Time"
                          : startTime!.format(context),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getTimeInput(endTime);
                    if (time == null) {
                      return;
                    }
                    if (startTime != null) {
                      //If Time 1 is selected
                      if (compareTimeOfDay(startTime!, time) == 1) {
                        displayAlert(
                          context,
                          "Alert",
                          "The end time is earlier than start time",
                        );
                        setState(() {
                          startTime = time;
                          endTime = time;
                        });
                      }
                    }
                    setState(() {
                      endTime = time;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      endTime == null ? "End Time" : endTime!.format(context),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
