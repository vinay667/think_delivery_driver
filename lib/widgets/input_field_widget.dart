import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';

class InputBoxWidget extends StatelessWidget {
  FocusNode focusNode;
  Function onTapTrigger;
  String labelText;
  bool isObscureText;

  InputBoxWidget({this.focusNode, this.onTapTrigger, this.labelText,this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: TextFormField(
        obscureText: isObscureText==null?false:isObscureText,
        onTap: onTapTrigger,
        focusNode: focusNode,
        style: TextStyle(
            fontSize: 17.0,
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700),
        decoration: new InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? MyColor.textFiledActiveColor
                  : Color.fromRGBO(40,43,47,0.25),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: focusNode.hasFocus?18:15,
              ),
          fillColor: Colors.white,
          //  contentPadding: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 20),
          contentPadding: EdgeInsets.all(20),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(
                color: MyColor.textFiledInActiveColor, width: 1.0),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide:
                new BorderSide(color: MyColor.textFiledActiveColor, width: 1.0),
          ),
          //fillColor: Colors.green
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
