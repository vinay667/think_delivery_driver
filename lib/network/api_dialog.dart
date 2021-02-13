
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';

class APIDialog
{
  static Future<void> showAlertDialog(BuildContext context,String dialogText) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(MyColor.driverThemeColor),
          ),
          Container(margin: EdgeInsets.only(left: 9), child: Text(dialogText,maxLines:2,style: TextStyle(color: MyColor.textBlueColor,fontFamily: 'OpenSans'),)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}






