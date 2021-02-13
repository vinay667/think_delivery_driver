

import 'package:flutter/cupertino.dart';
import 'package:think_delivery_driver/colors/colors.dart';

class EarningsWidget extends StatelessWidget
{
  final String text1,text2;
  EarningsWidget(this.text1,this.text2);
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Text(
          text1,
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: MyColor.defaultTextColor),
        ),



        Text(
          text2,
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'George',
              fontWeight: FontWeight.w600,
              color: MyColor.defaultTextColor),
        ),








      ],
    );
  }

}