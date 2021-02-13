

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';

class AccountWidget extends StatelessWidget
{
  final String title,desc;
  AccountWidget(this.title,this.desc);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 18,left: 15,right: 15),
      margin: EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 14,
              spreadRadius: 1
          ),
        ],

      ),
      // height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w800,
                    color: MyColor.defaultTextColor),
              ),

              SizedBox(height: 6),


              Text(
                desc,
                style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(40,43,47,0.6)),
              ),


            ],
          ),
         Padding(
           padding: EdgeInsets.only(top: 5),
           child:  Icon(Icons.arrow_forward_ios,color: MyColor.driverThemeColor),
         )
          
          




        ],
      ),

    );
  }

}



class AccountWidget2 extends StatelessWidget
{
  final String title,desc;
  AccountWidget2(this.title,this.desc);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 18,left: 15,right: 15),
      margin: EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 14,
              spreadRadius: 1
          ),
        ],

      ),
      // height: 100,
      child: Row(
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w900,
                    color: MyColor.defaultTextColor),
              ),

              SizedBox(height: 6),


              Text(
                desc,
                style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(48,107,178,1)),
              ),


            ],
          )




        ],
      ),

    );
  }

}


class AccountWidget3 extends StatelessWidget
{
  final String title;
  AccountWidget3(this.title);
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 26,bottom: 18,left: 15,right: 15),
      margin: EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 14,
              spreadRadius: 1
          ),
        ],

      ),
      // height: 100,
      child: Row(
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w900,
                    color: MyColor.defaultTextColor),
              ),

            ],
          )




        ],
      ),

    );
  }

}