
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';
import 'package:think_delivery_driver/widgets/input_field_widget2.dart';
import 'package:toast/toast.dart';
class ForgotPasswordScreen extends StatefulWidget
{
  ForgotPasswordState createState()=>ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordScreen>
{
  var fromData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var textControllerEmail = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.appBgColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[

            SizedBox(height: 120),

            Center(
              child:  Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'George',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(53,52,89, 1)),
              ),
            ),

            SizedBox(height: 15),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Enter The Email Address Associated With Your Account',
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'George',
                    color: MyColor.defaultTextColor),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),


            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DriverInputBoxWidget2(
                labelText: 'Enter Email Address',
                hintText: 'Enter Mail',
                controller: textControllerEmail,
                validator: emailValidator,
              ),
            ),

            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:  InkWell(
                onTap: () {
                  _submitHandler(context);
                },
                child: ButtonWidgetDriver('RESET PASSWORD',MyColor.driverThemeColor),
              ),
            )
          ],
        ),
      )


    );
  }
  String emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return 'Email is required and should be valid Email address.';
    }
    return null;
  }
  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    sendMail(context);

    ///all set to login
  }

  sendMail(BuildContext context) async {
    fromData["email"]=textControllerEmail.text;
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI(
        'forgot/password',
        fromData,
        context);
    Navigator.pop(context);
    if(response['success'])
      {
        Toast.show(response['message'], context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
        Navigator.pop(context);
      }




  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fromData = {
      'email': '',
    };
  }
}



