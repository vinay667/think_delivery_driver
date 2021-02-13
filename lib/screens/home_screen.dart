import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/screens/home_tab1.dart';
import 'package:think_delivery_driver/widgets/toggle.dart';

import 'home_tab2.dart';

class HomeScreen extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: MyColor.appBgColor,
        body: Column(
          children: <Widget>[
            Container(
              height: 159.5,
              // padding: EdgeInsets.only(left: 15,right: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColor.driverThemeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 59),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 20),
                      Expanded(
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 21,
                                fontFamily: 'George',
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: ToggleSwitch(
                          activeColor: Colors.white,
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: Color.fromRGBO(156, 212, 141, 1),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    child: TabBar(
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3.0, color: Colors.white),
                        insets: EdgeInsets.symmetric(horizontal: 72.0),
                      ),
                      tabs: [
                        Tab(
                          text: 'Active Order',

                          //icon: Icon(Icons.directions_bike),
                        ),
                        Tab(
                          text: 'Pending Order',
                          /*icon: Icon(
                              Icons.directions_car,
                            )*/
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomeTab1(),
                  HomeTab2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
