
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/network/constants.dart';
import 'package:think_delivery_driver/network/no_internet_check.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';
import 'package:think_delivery_driver/widgets/driver_input_field_email_widget.dart';
import 'package:think_delivery_driver/widgets/driver_input_field_widget.dart';
import 'package:think_delivery_driver/widgets/image_widget.dart';
import 'package:toast/toast.dart';
class EditProfileScreen extends StatefulWidget
{
  EditProfileState createState()=>EditProfileState();
}

class EditProfileState extends State<EditProfileScreen>
{
  bool cbValue = false;
  var controller;
  String staticEmail='';
  var _fromData;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  File _image;
  final picker = ImagePicker();
  String profileImage='';
  String driver_license='';
  String proof_of_insurance='';
  String vehicle_image='';
  FocusNode userNameFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  String image1URI = 'images/car_dum.jpg';
  bool imageStatus1 = false;
  File _image1;
  File _image2;
  File _image3;
  bool imageStatus2 = false;
  bool imageStatus3 = false;
  String image2URI = 'images/aadhar_dum.jpg';
  String image3URI = 'images/aadhar_dum.jpg';
  String icon1URI = 'images/upload_ic.png';
  String icon2URI = 'images/upload_ic.png';
  String icon3URI = 'images/upload_ic.png';
  String dropdownSelectedItem = 'Select Vehicle';
  List<String> listItems = ['Select Vehicle', 'Bike', 'Car', 'Bicycle'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode vehicleFocusNode = new FocusNode();
  var textControllerEmail = new TextEditingController();
  var textControllerPassword = new TextEditingController();
  var textControllerPhone = new TextEditingController();
  var textControllerName = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: MyColor.appBgColor,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: MyColor.driverThemeColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 55),
                    Row(

                      children: <Widget>[


                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'images/arrow_left.png',
                            width: 25,
                            height: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 13),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'George',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),

                      ],
                    ),
                    SizedBox(height: 25),

                    Center(
                        child: Container(
                          width: 110,
                          height: 84,
                          child: Stack(
                            children: <Widget>[
                              _image == null
                                  ? Container(
                                  width: 84,
                                  height: 84,
                                  margin: EdgeInsets.only(right: 15, left: 5),
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image:/* profileImage.contains('https')
                                              ? NetworkImage(profileImage)
                                              :*/ AssetImage(
                                              'images/dum_men.jpg'))))
                                  : Container(
                                width: 84,
                                height: 84,
                                margin: EdgeInsets.only(right: 15, left: 5),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new FileImage(_image))),
                              ),






                             /* Container(
                                  width: 84,
                                  height: 84,
                                  margin: EdgeInsets.only(right: 15, left: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'images/dum_men.jpg')))),
*/




                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){
                                    getImage();
                                  },
                                  child: Container(
                                    width: 30,

                                    height: 30,
                                    margin: EdgeInsets.only(right: 15, left: 5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: MyColor.driverThemeColor,width: 1.5),

                                    ),
                                    child: Image.asset('images/edit_profile.png'),


                                  ),
                                )
                              )


                            ],
                          ),
                        )
                    )
                  ],
                )),

            SizedBox(height: 38),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: <Widget>[
                  DriverInputBoxWidget(
                      labelText: 'Name',
                      focusNode: userNameFocusNode,
                      controller: textControllerName,
                      validator: emptyStringValidator,
                      iconURI: 'images/username_ic.png',
                      onTapTrigger: _requestFocusUserName),
                  SizedBox(height: 10),
                  DriverInputEmailWidget(
                      labelText: 'Email',
                      focusNode: emailFocusNode,
                      iconURI: 'images/email_ic.png',
                      validator: emailValidator,
                      controller: textControllerEmail,
                      onTapTrigger: _requestFocusEmail),
                  SizedBox(height: 10),
                  DriverInputEmailWidget(
                      labelText: 'Phone',
                      controller: textControllerPhone,
                      focusNode: phoneFocusNode,
                      validator: phoneValidator,
                      iconURI: 'images/phone_ic.png',
                      onTapTrigger: _requestFocusPhone),
                  SizedBox(height: 10),

                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Type of Vehicle',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(53, 52, 89, 0.7)),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 5, right: 10),
                                  width: 20,
                                  height: 22,
                                  child: Image.asset(
                                    'images/veh.png',
                                    fit: BoxFit.fill,
                                  )),
                              Expanded(
                                  child: Container(
                                    color: MyColor.appBgColor,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          isExpanded: true,
                                          items: listItems.map((String val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: new Text(val,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'OpenSans',
                                                      fontWeight: FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          53, 52, 89, 0.7))),
                                            );
                                          }).toList(),
                                          hint: Text(
                                            dropdownSelectedItem==null?'Select Vehicle':dropdownSelectedItem,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'OpenSans',
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(53, 52, 89, 0.7)),
                                          ),
                                          onChanged: (String val) {
                                            dropdownSelectedItem = val;
                                            setState(() {});
                                          }),
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(height: 2),
                          SizedBox(height: 1),
                          Container(
                              color: MyColor.textFiledInActiveColor,
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 12),
                        ],
                      )),


                  SizedBox(height: 18),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          uploadImageBottomSheet();

                        },
                        child: Container(
                            width: 170,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.5, color: MyColor.themeColorRed),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('images/gallery_ic.png',
                                    width: 25, height: 25),
                                SizedBox(width: 13),
                                Text(
                                  'Update Images',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w700,
                                      color: MyColor.themeColorRed),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: Container(),
                      )
                    ],
                  ),



                  SizedBox(height: 30),
                  InkWell(
                    onTap: (){
                      _submitHandler(context);
                    },
                    child:  ButtonWidgetDriver('UPDATE PROFILE',MyColor.driverThemeColor),
                  ),


                  SizedBox(height: 30),



                ],
              ),
            )






          ],
        ),
      )


    );
  }
  void _requestFocusUserName() {
    setState(() {
      FocusScope.of(context).requestFocus(userNameFocusNode);
    });
  }

  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _requestFocusPhone() {
    setState(() {
      FocusScope.of(context).requestFocus(phoneFocusNode);
    });
  }

  void _requestFocusPassword() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  getUserProfile() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPIWithHeader('driver/profile',_fromData, context);
    Navigator.pop(context);
    print(response);
    setState(() {
      textControllerName.text = response['data']['name'];
      textControllerEmail.text = response['data']['email'];
      textControllerPhone.text = response['data']['mobile'].toString();
      profileImage=response['data']['pimage'];
      vehicle_image=response['data']['vehicle_image'];
      proof_of_insurance=response['data']['proof_of_insurance'];
      driver_license=response['data']['driver_license'];
      dropdownSelectedItem=response['data']['type_of_vehicle'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData={
      'email':''
    };

    _fetchUserEmail();
  }


  _fetchUserEmail()async{

    SharedPreferences prefs=await SharedPreferences.getInstance();
    staticEmail=prefs.getString('email');
    _fromData['email']=staticEmail;
    checkInternetAPIcall();
  }

  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      getUserProfile();
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  String emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return 'Email is required and should be valid Email address.';
    }
    return null;
  }

  String emptyStringValidator(String value) {
    if (value.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }

  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    updateProfileData();
  }

  updateProfileData() async {
    print(textControllerName.text);
    print(textControllerPhone.text);
    print(textControllerEmail.text);
    print(UserModel.userId);
    APIDialog.showAlertDialog(context, 'Updating Profile...');
    try {
      var formData = FormData.fromMap({
        'name': textControllerName.text,
        'mobile': textControllerPhone.text,
        'email': textControllerEmail.text,
        'id': UserModel.userId,
        'pimage': _image == null
            ? null
            : await MultipartFile.fromFile(_image.path,
            filename: "profile_pic.jpg"),

        'type_of_vehicle':dropdownSelectedItem,

        'vehicle_image': _image1 == null
            ? null
            : await MultipartFile.fromFile(_image1.path,
            filename: "vehicle_image.jpg"),
        'proof_of_insurance': _image2 == null
            ? null
            : await MultipartFile.fromFile(_image2.path,
            filename: "proof_of_insurance.jpg"),
        'driver_license': _image3 == null
            ? null
            : await MultipartFile.fromFile(_image3.path,
            filename: "driver_license.jpg"),
      });
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = 'Bearer ' + UserModel.accessToken;
      print(AppConstant.appBaseURL+'updateprofile');
      final response = await dio.post(AppConstant.appBaseURL + 'updateprofile',
          data: formData);
      var res = response.data;
      print(res);
      Navigator.of(context, rootNavigator: true).pop();

      if (res['success']) {
        Toast.show('Profile Updated Successfully !!', context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
        Navigator.pop(context, 'Profile');
      } else {
        Toast.show(res['message'], context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
      }
    } on DioError catch (errorMessage) {
      Navigator.pop(context);
      String message = errorMessage.response.toString();
      print(message);
    }
  }

  String phoneValidator(String value) {
    if (value.length < 10) {
      return 'Phone number should have atleast 10 digits';
    }
    return null;
  }

  void uploadImageBottomSheet() {
    controller = key.currentState.showBottomSheet((c) => GestureDetector(
      onVerticalDragDown: (_) {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 24, top: 10),
                            child: Text(
                              'Update Images',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'George',
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(40, 43, 47, 1)),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 18),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset('images/cross_red.png',
                                    width: 16, height: 16),
                              ))
                        ],
                      ),
                      SizedBox(height: 25),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: DottedBorder(
                            dashPattern: [4, 4],
                            color: Colors.blue.withOpacity(0.5),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            strokeWidth: 2,
                            padding: EdgeInsets.zero,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 95,
                                width: double.infinity,
                                color: Color.fromRGBO(243, 250, 253, 1),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'images/gallery.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      'Upload image',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(
                                              39, 43, 47, 0.4)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20),
                      AddImageWidget(image1URI, 'Car', icon1URI,
                          uploadCarImage, _image1,vehicle_image),
                      SizedBox(height: 20),
                      AddImageWidget(image2URI, 'Proof of Insurance',
                          icon2URI, uploadInsuranceImage, _image2,proof_of_insurance),
                      SizedBox(height: 20),
                      AddImageWidget(image3URI, 'Driver License', icon3URI,
                          uploadDrivingLicenseImage, _image3,driver_license),
                      SizedBox(height: 30),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }
  uploadCarImage() {
    if (imageStatus1 == false) {
      getCarImage();
    }
  }
  Future getCarImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    controller.setState(() {
      _image1 = File(pickedFile.path);
      icon1URI = 'images/check_circle.png';
    });
  }

  Future getInsuranceImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    controller.setState(() {
      _image2 = File(pickedFile.path);
      icon2URI = 'images/check_circle.png';
    });
  }

  Future getLicenseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    controller.setState(() {
      _image3 = File(pickedFile.path);
      icon3URI = 'images/check_circle.png';
    });
  }
  uploadInsuranceImage() {
    if (imageStatus2 == false) {
      getInsuranceImage();
    }
  }

  uploadDrivingLicenseImage() {
    if (imageStatus3 == false) {
      getLicenseImage();
    }
  }
}



