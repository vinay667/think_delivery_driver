

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';

class ButtonWidgetBlank extends StatelessWidget
{
  final String btnText;
  ButtonWidgetBlank(this.btnText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromRGBO(187, 49, 44, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            btnText,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
          SizedBox(width: 10),
         /* Image.asset(
            'images/arrow_right.png',
            width: 25,
            height: 15,
          )*/
        ],
      ),
    );
  }

}


class ButtonWidgetDriver extends StatelessWidget
{
  final String btnText;
  ButtonWidgetDriver(this.btnText,this.btnBG);
  final Color btnBG;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: btnBG,
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            btnText,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          SizedBox(width: 10),
          /* Image.asset(
            'images/arrow_right.png',
            width: 25,
            height: 15,
          )*/
        ],
      ),
    );
  }

}



class ButtonWithBorder extends StatelessWidget
{
  final String btnText;
  final Color color;
  ButtonWithBorder(this.btnText,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 2,color:color ),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            btnText,
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
                color: color),
          ),
          SizedBox(width: 10),
          /* Image.asset(
            'images/arrow_right.png',
            width: 25,
            height: 15,
          )*/
        ],
      ),
    );
  }

}


class ButtonWithBorder2 extends StatelessWidget
{
  final String btnText;
  final Color color;
  ButtonWithBorder2(this.btnText,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(width: 2,color: Color.fromRGBO(217,217,217,1)),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            btnText,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
                color: color),
          ),
          SizedBox(width: 10),
          /* Image.asset(
            'images/arrow_right.png',
            width: 25,
            height: 15,
          )*/
        ],
      ),
    );
  }

}

class ButtonWithBorder3 extends StatelessWidget
{
  final String btnText;
  final Color color;
  ButtonWithBorder3(this.btnText,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5,color: color),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            btnText,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
                color: color),
          ),
          SizedBox(width: 10),
          /* Image.asset(
            'images/arrow_right.png',
            width: 25,
            height: 15,
          )*/
        ],
      ),
    );
  }

}