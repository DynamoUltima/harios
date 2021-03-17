import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harios/ui/resources/colors.dart';
import 'package:harios/ui/resources/icons.dart';

import 'package:harios/ui/screens/appointment.dart';

import 'account.dart';
import 'history.dart';
import 'service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

_homeAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Text(
      "Harios Salon",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontFamily: 'Lobster',
        fontSize: 30,
        shadows: [
          Shadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
    ),
    actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
              onTap: () {},
              child: SvgPicture.string(
                bellIcon,
                allowDrawingOutsideViewBox: true,
              ))),
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.string(
              cartIcon,
              allowDrawingOutsideViewBox: true,
            ),
          )),
    ],
  );
}

Widget _floatingButton({BuildContext context}) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Appointment()),
      );
    },
    tooltip: 'Add Appointment',
    child: SvgPicture.string(
      plusIcon,
    ),
    backgroundColor: AppColors.primaryColor,
    elevation: 2.0,
  );
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   _bottomBar() {
      return BottomAppBar(
        notchMargin: 12,
        shape: CircularNotchedRectangle(),

        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                showSelectedLabels: false,
                // unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                // selectedItemColor: Colors.blue,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.string(
                      homeIcon,
                      color: AppColors.textColor,
                    ),
                    label: '',
                    activeIcon: SvgPicture.string(
                      homeIcon,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.string(
                      userIcon,
                       color: AppColors.textColor,
                    ),
                    label: '',
                     activeIcon: SvgPicture.string(
                      userIcon,
                        color: AppColors.primaryColor,
                    )
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.string(
                      registerIcon,
                      color: AppColors.textColor,
                    ),
                    label: '',
                    activeIcon: SvgPicture.string(
                      registerIcon,
                      color: AppColors.primaryColor,
                    )
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 10,
                )),
          ],
        ),

        // color: Colors.blueGrey
      );
    }

  List<Widget> basePages = <Widget>[Service(), History(), Account()];

  @override
  Widget build(BuildContext context) {
   

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _homeAppbar(),
        body: basePages.elementAt(_selectedIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: _floatingButton(context: context),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }
}
