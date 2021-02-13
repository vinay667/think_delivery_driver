import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/network/no_internet_check.dart';
import 'package:think_delivery_driver/screens/add_bank_account_screen.dart';
import 'package:think_delivery_driver/screens/change_password_screen.dart';
import 'package:think_delivery_driver/screens/edit_profile_screen.dart';
import 'package:think_delivery_driver/screens/faq_screen.dart';
import 'package:think_delivery_driver/screens/login_driver_screen.dart';
import 'package:think_delivery_driver/screens/terms_screen.dart';
import 'package:think_delivery_driver/widgets/account_widget.dart';
import 'package:toast/toast.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  String name='',email='',phone='',emailNOR='',profileImage='';
  var _fromData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.appBgColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              height: 207,
              decoration: BoxDecoration(
                color: MyColor.driverThemeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'George',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    InkWell(
                      onTap: ()async{



                        final result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                       if(result!=null)
                         {
                           checkInternetAPIcall();
                         }
                        },
                      child:Container(
                        width: 70,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'EDIT',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.driverThemeColor),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Icon(
                                  Icons.edit,
                                  color: MyColor.driverThemeColor,
                                  size: 12,
                                ))
                          ],
                        ),
                      ),
                    )
                    ],
                  ),
                  SizedBox(height: 7),
                  Container(
                    /* decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(width: 1.0, color: Color(0x66c5e0ff))),
                    ),*/
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Container(
                                  width: 72,
                                  height: 72,
                                  margin: EdgeInsets.only(right: 15, left: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:/*profileImage=='' || profileImage==null?*/ AssetImage(
                                              'images/dum_men.jpg')/*:
                                             NetworkImage(profileImage)*/

                                      ))),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 9, bottom: 3),
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                        fontFamily: 'George',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 2),
                                    child: Text(
                                      email,
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              254, 254, 254, 0.7),
                                          fontSize: 13.0,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'OpenSans',
                                          letterSpacing: 0.17,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 13),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.call, color: Colors.white),
                                        SizedBox(width: 10),
                                        Text(
                                          phone,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'George',
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(40, 43, 47, 0.4),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
            },
            child:AccountWidget('Change Password', 'Update your app credentials'),
          ),
          SizedBox(height: 19),
          AccountWidget('Manage Delivery Type', 'Delivery Method'),
          SizedBox(height: 19),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAccountScreen()));
            },
            child: AccountWidget('Manage Bank Account',
                'Bank account for payout of your earnings'),
          ),

          SizedBox(height: 19),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQScreen()));
            },
            child: AccountWidget('FAQs', 'View frequently asked questions'),
          ),



          SizedBox(height: 19),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsScreen()));
           },
           child:  AccountWidget('Terms & Conditions', 'Update your app credentials'),
         ),
          SizedBox(height: 19),
          AccountWidget3('Share App'),
          SizedBox(height: 19),
          AccountWidget2('Contact us', 'enquiries@thinkdlivery.com'),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child:GestureDetector(
              onTap: (){
               showLogOutDialog(context);
              },
              child:  Row(
                children: <Widget>[
                  Image.asset('images/power_set.png', width: 18, height: 18),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          color: MyColor.themeColorRed),
                    ),
                  ),
                ],
              ),
            )
          ),

          SizedBox(height: 30),

        ],
      ),
    );
  }
  getUserProfile() async {
    FocusScope.of(context).unfocus();
    _fromData['email']=emailNOR;
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI('driver/profile',_fromData, context);
    Navigator.pop(context);
    print(response);
    setState(() {
      name=response['data']['name']==null?'NA':response['data']['name'];
      email=response['data']['email'];
      phone=response['data']['mobile'].toString();
      profileImage=response['data']['pimage'];
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'email': '',
    };
  _fetchEmail();

  }


  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      getUserProfile();
    }
  }
  showLogOutDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        APIDialog.showAlertDialog(context, 'Logging out...');
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        UserModel.setAccessToken('null');
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DriverLoginScreen()),
                (Route<dynamic> route) => false);
        Toast.show('Logged Out Successfully !!', context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to Log out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _fetchEmail()async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    emailNOR=prefs.getString("email"??'NA');
    print(emailNOR);

    checkInternetAPIcall();
  }

}
