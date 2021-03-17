import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harios/ui/resources/colors.dart';
import 'package:harios/ui/resources/icons.dart';
import 'package:table_calendar/table_calendar.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

Widget _floatingButton({BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: FloatingActionButton(
      onPressed: () {
        // Navigator.push( context,
        //   MaterialPageRoute(builder: (context) => SecondRoute()),
        // );
      },
      tooltip: 'Add Appointment',
      child: SvgPicture.string(
        thumbIcon,
        width: 30,
        color: Colors.white,
      ),
      backgroundColor: AppColors.primaryColor,
      elevation: 2.0,
    ),
  );
}

class _AppointmentState extends State<Appointment> {
  CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: SvgPicture.string(backIcon),
            onTap: () {},
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            "Appointment",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Open Sans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            calendarWidget(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _floatingButton(context: context),
    ));
  }

  Widget calendarWidget() {
    return Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(8.0),
            child: TableCalendar(
              calendarController: _calendarController,
              weekendDays: [DateTime.saturday,DateTime.sunday,],
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor
                ),
                headerMargin: EdgeInsets.all(8.0),
                titleTextStyle: TextStyle(color: Colors.white),
                formatButtonDecoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)
                  
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                leftChevronIcon: Icon(Icons.chevron_left,color: Colors.white,),
                rightChevronIcon: Icon(Icons.chevron_right,color: Colors.white,)
              ),
            ),
          );
  }
}
