import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
class DriverInputBoxWidget2 extends StatelessWidget {
  String labelText,hintText,initialValue;
  bool isObscure;
  var controller;
  final Function validator;
  bool isNumeric;

  DriverInputBoxWidget2({this.labelText,this.hintText,this.isObscure,this.initialValue,this.validator,this.controller,this.isNumeric});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              labelText,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(53,52,89,0.7)),
            ),


            TextFormField(
              obscureText: isObscure==null?false:isObscure,
              initialValue: initialValue,
              controller: controller,
              keyboardType: isNumeric==true?TextInputType.number:TextInputType.emailAddress,
              validator: validator,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color.fromRGBO(53,52,89,1),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700),
              decoration: new InputDecoration(
                hintText: hintText,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColor.textFiledInActiveColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColor.driverThemeColor),
                ),
                hintStyle: TextStyle(
                  color:Color.fromRGBO(40,43,47,0.25),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                fillColor: Colors.white,
              ),
            ),

           // Container(color:MyColor.textFiledActiveColor,height: 1.5,width: double.infinity),
            SizedBox(height: 12),
          ],
        )
    );
  }
}