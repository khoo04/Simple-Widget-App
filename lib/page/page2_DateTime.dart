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
  DateTime? slot1_startDate;
  DateTime? slot1_endDate;

  DateTime? slot2_startDate;
  DateTime? slot2_endDate;

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
                    "Date Range Slot 1",
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
                    if (slot1_endDate != null) {
                      if (slot1_endDate!.isBefore(date)) {
                        displayAlert(
                          context,
                          "Alert",
                          "The start date cannot later than end date",
                        );
                        setState(() {
                          slot1_startDate = date;
                          slot1_endDate = date;
                        });
                      }
                    }
                    setState(() {
                      slot1_startDate = date;
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
                      slot1_startDate == null
                          ? "Start Date"
                          : dateFormat(slot1_startDate!),
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
                    if (slot1_startDate != null) {
                      if (slot1_startDate!.isAfter(date)) {
                        displayAlert(
                          context,
                          "Alert",
                          "The end date cannot earlier than start date",
                        );
                        setState(() {
                          slot1_startDate = date;
                          slot1_endDate = date;
                        });
                      }
                    }
                    setState(() {
                      slot1_endDate = date;
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
                      slot1_endDate == null
                          ? "End Date"
                          : dateFormat(slot1_endDate!),
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
          //SLOT 2
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: double.infinity, // Expand to fill the width
                  height: 50,
                  child: const Text(
                    "Date Range Slot 2",
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
                    if (slot1_endDate == null || slot1_startDate == null) {
                      displayAlert(context, "Alert",
                          "Please choose the slot 1 date first");
                      return;
                    } else {
                      if (date.isBefore(slot1_endDate!)) {
                        displayAlert(context, "Alert",
                            "The slot 2 start date must be after slot 1 end date");
                        return;
                      }
                    }
                    if (slot2_endDate != null) {
                      if (slot2_endDate!.isBefore(date)) {
                        displayAlert(
                          context,
                          "Alert",
                          "The start date cannot later than end date",
                        );
                        setState(() {
                          slot2_startDate = date;
                          slot2_endDate = date;
                        });
                      }
                    }
                    setState(() {
                      slot2_startDate = date;
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
                      slot2_startDate == null
                          ? "Start Date"
                          : dateFormat(slot2_startDate!),
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
                    if (slot1_endDate == null || slot1_startDate == null) {
                      displayAlert(context, "Alert",
                          "Please choose the slot 1 date first");
                      return;
                    } else {
                      if (date.isBefore(slot1_endDate!)) {
                        displayAlert(context, "Alert",
                            "The slot 2 end date must be after slot 1 end date");
                        return;
                      }
                    }
                    if (slot2_startDate != null) {
                      if (slot2_startDate!.isAfter(date)) {
                        displayAlert(
                          context,
                          "Alert",
                          "The end date cannot earlier than start date",
                        );
                        setState(() {
                          slot2_startDate = date;
                          slot2_endDate = date;
                        });
                      }
                    }
                    setState(() {
                      slot2_endDate = date;
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
                      slot2_endDate == null
                          ? "End Date"
                          : dateFormat(slot2_endDate!),
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
