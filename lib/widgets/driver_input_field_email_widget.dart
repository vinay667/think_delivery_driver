import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
class DriverInputEmailWidget extends StatelessWidget {
  FocusNode focusNode;
  Function onTapTrigger;
  String labelText;
  String iconURI;
  bool isObscure;
  final Function validator;
  var controller;
  DriverInputEmailWidget({this.focusNode, this.onTapTrigger, this.labelText,this.iconURI,this.isObscure,this.validator,this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText,
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(53,52,89,0.7)),
          ),

          SizedBox(height: 2),
          Stack(
            children: <Widget>[
              TextFormField(
                obscureText: isObscure==null?false:isObscure,
                onTap: onTapTrigger,
                controller: controller,
                validator: validator,
                focusNode: focusNode,
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700),
                decoration: new InputDecoration(
                  hintText: labelText,
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
                    fontSize: 16,
                  ),
                  fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 34),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Container(
                margin: EdgeInsets.only(top: 14),
                width: 25,
                height: 20,
                child: Image.asset(
                  iconURI,
                  fit: BoxFit.fill,
                  color: focusNode.hasFocus?MyColor.driverThemeColor:MyColor.textFiledInActiveColor,
                )),


            ],
          ),
          SizedBox(height: 1),

        //  Container(color: focusNode.hasFocus?MyColor.driverThemeColor:MyColor.textFiledInActiveColor,height: 1,width: double.infinity),
          SizedBox(height: 12),
        ],
      )
    );
  }
}


/*
prefixIcon: Container(
width: 15,
height: 15,
padding: const EdgeInsets.only(right: 15,top: 15,bottom: 9),
child: Image.asset(
'images/username_ic.png',
fit: BoxFit.fill,
),
),*/
