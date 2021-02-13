import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/Utils.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/screens/dummy.dart';
import 'package:think_delivery_driver/screens/forgot_password_screen.dart';
import 'package:think_delivery_driver/screens/sign_up_screen.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';
import 'package:think_delivery_driver/widgets/driver_input_field_widget.dart';
import 'package:toast/toast.dart';

import 'landing_screen.dart';
class DriverLoginScreen extends StatefulWidget {
  DriverLoginScreenState createState() => DriverLoginScreenState();
}

class DriverLoginScreenState extends State<DriverLoginScreen> {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  var textControllerEmail = new TextEditingController();
  var textControllerPassword = new TextEditingController();
  var _fromData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.appBgColor,
        body: Padding(
          padding: EdgeInsets.only(left: 28, right: 28),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 70),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(40, 43, 47, 0.9)),
                ),
                SizedBox(height: 8),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'George',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(40, 43, 47, 1)),
                ),
                SizedBox(height: 45),
                DriverInputBoxWidget(
                    labelText: 'User Name',
                    focusNode: emailFocusNode,
                    validator: emailValidator,
                    controller: textControllerEmail,
                    iconURI: 'images/username_ic.png',
                    onTapTrigger: _requestFocusEmail),
                SizedBox(height: 5),
                DriverInputBoxWidget(
                    labelText: 'Password',
                    focusNode: passwordFocusNode,
                    iconURI: 'images/pwd_lock.png',
                    isObscure: true,
                    controller: textControllerPassword,
                    validator: passwordValidator,
                    onTapTrigger: _requestFocusPass),
                SizedBox(height: 5),

                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'MontserratAlternates',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            color:MyColor.textFiledInActiveColor),
                      ),
                    )
                ),
                SizedBox(height: 35),
                InkWell(
                  onTap: () {
                    _submitHandler(context);

                    /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));*/
                  },
                  child: ButtonWidgetDriver('Sign In',MyColor.driverThemeColor),
                ),
                SizedBox(height: 17),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  },
                  child: ButtonWithBorder('REGISTER AS A DRIVER',Color.fromRGBO(48,107,178,1)),
                )


              ],
            ),
          )
        ));
  }

  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }


  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    loginUser(context);

    ///all set to login
  }

  loginUser(BuildContext context) async {
    _fromData["email"]=textControllerEmail.text;
    _fromData["password"]=textControllerPassword.text;
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Logging in...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI(
        'oauth/token',
        _fromData,
        context);
    Navigator.pop(context);
    _saveUserDetail(response);
    Route route = MaterialPageRoute(
        builder: (context) => MainScreen());
    Navigator.pushAndRemoveUntil(
        context, route, (Route<dynamic> route) => false);
    Toast.show('Logged in Successfully !!', context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
        backgroundColor: Colors.black);
  }
  _saveUserDetail(var response) async {
    UserModel.setAccessToken(response['data']['access_token']);
    UserModel.setUserId(response['data']['id'].toString());
    MyUtils.saveSharedPreferences('access_token', response['data']['access_token']);
    MyUtils.saveSharedPreferences('id', response['data']['id'].toString());
    MyUtils.saveSharedPreferences('email', response['data']['email']);
    MyUtils.saveSharedPreferences('mobile', response['data']['mobile']);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'email': '',
      'password': '',
      'device_type':'android',
      'device_token':'XjdAggfAhgAff',
      'device_id':'ahdgfdgfef'
    };
  }
  String emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return 'Email is required and should be valid Email address.';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Password is required.';
    }
    return null;
  }
}
