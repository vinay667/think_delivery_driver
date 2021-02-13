import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';
import 'package:think_delivery_driver/widgets/input_field_widget2.dart';
import 'package:think_delivery_driver/widgets/password_widget.dart';
import 'package:toast/toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePasswordScreen> {
  var _fromData;
  var textControllerCurrentPassword = new TextEditingController();
  var textControllerNewPassword = new TextEditingController();
  var textControllerConfirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.appBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              SizedBox(width: 15),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 11),
                    child: Image.asset(
                      'images/arrow_left.png',
                      width: 27,
                      height: 27,
                    ),
                  )),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'George',
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(53, 52, 89, 1)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please enter your new password',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'George',
                        color: MyColor.defaultTextColor),
                  ),
                ],
              )
            ],
          ),

          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PasswordWidget(
              labelText: 'Old Password',
              hintText: 'Old Password',
              isObscure: true,
              controller: textControllerCurrentPassword,
            ),
          ),

          //SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PasswordWidget(
              labelText: 'New Password',
              hintText: 'New Password',
              isObscure: true,
              controller: textControllerNewPassword,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PasswordWidget(
              labelText: 'Confirm New Password',
              hintText: 'Confirm New Password',
              isObscure: true,
              controller: textControllerConfirmPassword,
            ),
          ),

          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                if (textControllerCurrentPassword.text == '') {
                  Toast.show('Old Password cannot be empty !!', context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.black);
                } else if (textControllerNewPassword.text == '') {
                  Toast.show('New Password cannot be empty !!', context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.black);
                } else if (textControllerConfirmPassword.text == '') {
                  Toast.show('Confirm Password cannot be empty !!', context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.black);
                } else if (textControllerConfirmPassword.text !=
                    textControllerNewPassword.text) {
                  Toast.show('Password and Confirm Password should be same !!',
                      context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.black);
                } else
                  changePassword();
              },
              child: ButtonWidgetDriver(
                  'CHANGE PASSWORD', MyColor.driverThemeColor),
            ),
          )
        ],
      ),
    );
  }

  changePassword() async {
    _fromData["old_password"] = textControllerCurrentPassword.text;
    _fromData["new_password"] = textControllerNewPassword.text;
    _fromData["confirm_password"] = textControllerConfirmPassword.text;
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Changing password...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response =
        await helper.postAPIWithHeader('change/password', _fromData, context);
    Navigator.pop(context);
    print(response);
    if (response['success']) {
      Navigator.pop(context);
      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    } else {
      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'old_password': '',
      'new_password': '',
      'id': UserModel.userId,
      'confirm_password': '',
    };
  }
}
