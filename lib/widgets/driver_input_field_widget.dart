import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
class DriverInputBoxWidget extends StatelessWidget {
  FocusNode focusNode;
  Function onTapTrigger;
  String labelText;
  String iconURI;
  bool isObscure;
  final Function validator;
   var controller;

  DriverInputBoxWidget({this.focusNode, this.onTapTrigger, this.labelText,this.iconURI,this.isObscure,this.validator,this.controller});

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
                focusNode: focusNode,
                validator: validator,
                controller: controller,
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
                  //border: InputBorder.none,
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
                margin: EdgeInsets.only(top: 13),
                width: 20,
                height: 22,
                child: Image.asset(
                  iconURI,
                  fit: BoxFit.fill,
                  color: focusNode.hasFocus?MyColor.driverThemeColor:MyColor.textFiledInActiveColor,
                )),


            ],
          ),
          SizedBox(height: 1),

         // Container(color: focusNode.hasFocus?MyColor.driverThemeColor:MyColor.textFiledInActiveColor,height: 1,width: double.infinity),
          SizedBox(height: 12),
        ],
      )
    );
  }
}


