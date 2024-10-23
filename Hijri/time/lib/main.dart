import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
void main (){
  runApp(
MaterialApp(home: SS(),)
  );
}
class SS extends StatefulWidget {
  @override
  State<SS> createState() => _SSState();
}

class _SSState extends State<SS> {
  String nom = "";
  String date = "";
  String time = "";
  String hijriDate = "";

  void updateTime() {
    setState(() {
      DateTime now = DateTime.now();
      nom = now.millisecond.toString();
      date = "${now.year}-${now.month}-${now.day}";
      time = "${now.hour}:${now.minute}:${now.second}";
      hijriDate = HijriCalendar.now().toFormat("yyyy-MM-dd");
    });
     Future.delayed(Duration(milliseconds: 1), () {
      updateTime();
    });
  }

  @override
  void initState() {
    super.initState();
    updateTime();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  nom,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First Container: Year, Month, Day
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Date: $date",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                // Second Container: Hour, Minute, Second
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Time: $time",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                // Third Container: Hijri Year
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    " $hijriDate",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
