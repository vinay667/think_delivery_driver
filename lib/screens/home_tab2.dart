import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';

import 'order_detail_pending_screen.dart';

class HomeTab2 extends StatefulWidget {
  HomeTab2State createState() => HomeTab2State();
}

class HomeTab2State extends State<HomeTab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int position) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailDelivered()));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 12, right: 12, top: position == 0 ? 25 : 0),
                      //height: 210,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              blurRadius: 8,
                              spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(250, 250, 255, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 18),
                                      child: Text(
                                        '#ORD0001',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w900,
                                            color: MyColor.defaultTextColor),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 3),
                                      child: Text(
                                        'Package short description detailing the package details added the customer displayed here.',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600,
                                            color: MyColor.defaultTextColor),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 60,
                                transform:
                                    Matrix4.translationValues(0.0, -7.0, 0.0),
                                child: Center(
                                  child: Text(
                                    '\$15',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'George',
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(187, 49, 44, 1)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(
                            color: Color.fromRGBO(221, 221, 221, 1),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Image.asset('images/locv_red.png',
                                            width: 15, height: 15),
                                        Dash(
                                            direction: Axis.vertical,
                                            length: 40,
                                            dashLength: 4,
                                            dashColor: MyColor.themeColorRed),
                                        Image.asset('images/locv_red.png',
                                            width: 15, height: 15),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'From:',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        206, 206, 206, 1)),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'July 8th 2020',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        48, 107, 178, 1)),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '64 Momingview Lane, New York',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'OpenSans',
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    40, 43, 47, 0.7)),
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'To:',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        206, 206, 206, 1)),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'July 8th 2020',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        48, 107, 178, 1)),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '64 Momingview Lane, New York',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'OpenSans',
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    40, 43, 47, 0.7)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: ButtonWithBorder2(
                                      'Reject', MyColor.themeColorRed),
                                  flex: 1,
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: ButtonWithBorder3(
                                      'Accept', MyColor.driverThemeColor),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ));
          }),
    );
  }
}
