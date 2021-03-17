
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harios/ui/resources/colors.dart';
import 'package:harios/ui/resources/icons.dart';

class Service extends StatelessWidget {
  const Service({
    Key key,
  }) : super(key: key);

  
get _promoBanner {
  return Padding(
    padding: EdgeInsets.all(25),
    child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Invite your friends',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            'Get up to 10% Discount',
                            style: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 17,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      // Text('Invite your friends')
                    ],
                  ))
            ],
          ),
        )),
  );
}

Widget _services({List items}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _service(icon: items[0][0], label: items[0][1]),
      _service(icon: items[1][0], label: items[1][1])
    ],
  );
}


Widget _service({String icon, String label, VoidCallback ontap}) {
  return Container(
    height: 120,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17.0),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.16),
          blurRadius: 6.0, // soften the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            3.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    ),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 60,
            height: 50,
            child: SvgPicture.string(
              icon,
              fit: BoxFit.contain,
              color: AppColors.primaryColor,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 19, color: AppColors.secondaryColor),
        )
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    _promoBanner,
    SizedBox(height: 30),
    Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: _services(items: [
          [nailsIcon, 'Nails'],
          [manicureIcon, 'Manicure']
        ])),
    Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
        child: _services(items: [
          [pedicureIcon, 'Pedicure'],
          [makeupIcon, 'Makeup']
        ]))
      ],
    );
  }
}
