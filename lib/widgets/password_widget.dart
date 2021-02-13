import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
class PasswordWidget extends StatelessWidget {
  String labelText,hintText,initialValue;
  bool isObscure;
  var controller;

  PasswordWidget({this.labelText,this.hintText,this.isObscure,this.initialValue,this.controller});

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

      Container(
        child: Stack(
          children: <Widget>[


            TextFormField(
              controller: controller,
              obscureText: isObscure==null?false:isObscure,
              initialValue: initialValue,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color.fromRGBO(53,52,89,1),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700),
              decoration: new InputDecoration(
                hintText: hintText,

                border: InputBorder.none,
                hintStyle: TextStyle(
                  color:Color.fromRGBO(40,43,47,0.25),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
            ),


            Align(
              alignment: Alignment.centerRight,
              child:Padding(
                padding: EdgeInsets.only(top: 17),
                child:  Image.asset('images/visibility.png',width: 20,height: 23,),
              )
            ),


            SizedBox(width: 20)

          ],
        ),
      ),



            Container(color:MyColor.textFiledActiveColor,height: 1.5,width: double.infinity),
            SizedBox(height: 12),
          ],
        )
    );
  }
}