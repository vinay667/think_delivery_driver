import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/constants.dart';
import 'package:think_delivery_driver/screens/dummy.dart';
import 'package:think_delivery_driver/screens/login_driver_screen.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';
import 'package:think_delivery_driver/widgets/driver_input_field_email_widget.dart';
import 'package:think_delivery_driver/widgets/driver_input_field_widget.dart';
import 'package:think_delivery_driver/widgets/image_widget.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen> {
  bool cbValue = false;
  var controller;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  FocusNode userNameFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode vehicleNoFocusNode = new FocusNode();
  FocusNode vehicleFocusNode = new FocusNode();
  var textControllerEmail = new TextEditingController();
  var textControllerVehicleNo = new TextEditingController();
  var textControllerPassword = new TextEditingController();
  var textControllerPhone = new TextEditingController();
  var textControllerName = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String image1URI = 'images/car_dum.jpg';
  bool imageStatus1 = false;
  File _image1;
  File _image2;
  File _image3;
  final picker = ImagePicker();
  bool imageStatus2 = false;
  bool imageStatus3 = false;
  String image2URI = 'images/aadhar_dum.jpg';
  String image3URI = 'images/aadhar_dum.jpg';
  String icon1URI = 'images/upload_ic.png';
  String icon2URI = 'images/upload_ic.png';
  String icon3URI = 'images/upload_ic.png';
  String dropdownSelectedItem = 'Select Vehicle';
  List<String> listItems = ['Select Vehicle', 'Bike', 'Car', 'Bicycle'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        backgroundColor: MyColor.appBgColor,
        body: Padding(
            padding: EdgeInsets.only(left: 28, right: 28),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.zero,
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
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'George',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(40, 43, 47, 1)),
                  ),
                  SizedBox(height: 25),
                  DriverInputBoxWidget(
                      labelText: 'Name',
                      focusNode: userNameFocusNode,
                      controller: textControllerName,
                      iconURI: 'images/username_ic.png',
                      validator: emptyStringValidator,
                      onTapTrigger: _requestFocusUserName),
                  SizedBox(height: 10),
                  DriverInputEmailWidget(
                      labelText: 'Email',
                      focusNode: emailFocusNode,
                      iconURI: 'images/email_ic.png',
                      controller: textControllerEmail,
                      validator: emailValidator,
                      onTapTrigger: _requestFocusEmail),
                  SizedBox(height: 10),
                  DriverInputEmailWidget(
                      labelText: 'Phone',
                      controller: textControllerPhone,
                      validator: phoneValidator,
                      focusNode: phoneFocusNode,
                      iconURI: 'images/phone_ic.png',
                      onTapTrigger: _requestFocusPhone),
                  SizedBox(height: 10),
                  DriverInputBoxWidget(
                      labelText: 'Password',
                      focusNode: passwordFocusNode,
                      controller: textControllerPassword,
                      validator: emptyStringValidator,
                      iconURI: 'images/pwd_lock.png',
                      isObscure: true,
                      onTapTrigger: _requestFocusPassword),
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
                                    dropdownSelectedItem,
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
                  SizedBox(height: 10),
                  DriverInputBoxWidget(
                      labelText: 'Vehicle Number',
                      focusNode: vehicleNoFocusNode,
                      controller: textControllerVehicleNo,
                      validator: emptyStringValidator,
                      iconURI: 'images/veh.png',
                      onTapTrigger: _requestFocusNumber),
                  SizedBox(height: 18),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          driverAssignedBottomSheet();
                          //showAddImagesDialog();
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Dummy()));
                        },
                        child: Container(
                            width: 160,
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
                                  'Add Images',
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
                  SizedBox(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            value: cbValue,
                            onChanged: (value) {
                              setState(() {
                                cbValue = value;
                              });
                            },
                            activeColor: MyColor.driverThemeColor,
                            checkColor: Colors.white,
                            tristate: false,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        width: MediaQuery.of(context).size.width - 90,
                        child: Text(
                          'By Signing up you agree to our Terms & Conditions and Privacy Policy',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(40, 43, 47, 1),
                              fontSize: 12,
                              letterSpacing: -0.2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      _submitHandler(context);
                    },
                    child: ButtonWidgetDriver(
                        'SIGN UP', Color.fromRGBO(48, 107, 178, 1)),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverLoginScreen()));
                    },
                    child:
                        ButtonWithBorder('SIGN IN', MyColor.driverThemeColor),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            )));
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
  void _requestFocusNumber() {
    setState(() {
      FocusScope.of(context).requestFocus(vehicleNoFocusNode);
    });
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

/*  void _requestFocusVehicle() {
    setState(() {
      FocusScope.of(context).requestFocus(vehicleFocusNode);
    });
  }*/

  showAddImagesDialog() {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Align(
                alignment: Alignment.bottomCenter,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 24, top: 10),
                                    child: Text(
                                      'Add Images',
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
                                        child: Image.asset(
                                            'images/cross_red.png',
                                            width: 16,
                                            height: 16),
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
                                  uploadCarImage, _image1,''),
                              SizedBox(height: 20),
                              AddImageWidget(image2URI, 'Proof of Insurance',
                                  icon2URI, uploadInsuranceImage, _image2,''),
                              SizedBox(height: 20),
                              AddImageWidget(image3URI, 'Driver License',
                                  icon3URI, uploadDrivingLicenseImage, _image3,''),
                              SizedBox(height: 30),
                            ],
                          ),
                        )),
                  ],
                ));
          },
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  void driverAssignedBottomSheet() {
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
                                  'Add Images',
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
                              uploadCarImage, _image1,''),
                          SizedBox(height: 20),
                          AddImageWidget(image2URI, 'Proof of Insurance',
                              icon2URI, uploadInsuranceImage, _image2,''),
                          SizedBox(height: 20),
                          AddImageWidget(image3URI, 'Driver License', icon3URI,
                              uploadDrivingLicenseImage, _image3,''),
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

  String phoneValidator(String value) {
    if (value.length < 10) {
      return 'Phone number should have atleast 10 digits';
    }
    return null;
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
    print('Validations Passed');
    createDriver();
  }

  createDriver() async {
    APIDialog.showAlertDialog(context, 'Creating Account...');
    try {
      var formData = FormData.fromMap({
        'name': textControllerName.text.toString(),
        'device_id': 'gvccxdg',
        'device_type': 'android',
        'email': textControllerEmail.text.toString(),
        'mobile': textControllerPhone.text.toString(),
        'password': textControllerPassword.text.toString(),
       'vehicle_image': await MultipartFile.fromFile(_image1.path),
        'proof_of_insurance': await MultipartFile.fromFile(_image2.path,
            filename: "insurance_pic.jpg"),
        'driver_license': await MultipartFile.fromFile(_image3.path,
            filename: "driving_license_pic.jpg"),
        'device_token': 'XjdAggfAhgAff',
        'type_of_vehicle': 'van',
        'vehicle_number': textControllerVehicleNo.text,
      });
      print(formData.fields);
      Dio dio = new Dio();
      print('Api Called');
      final responseDio =
          await dio.post(AppConstant.appBaseURL + 'register', data: formData);
      Navigator.of(context, rootNavigator: true).pop();

      var response = responseDio.data;
      print(response);

      if (response['success']) {
        Toast.show(response['message'], context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
        Navigator.pop(context, true);
      }
    } on DioError catch (errorMessage) {
      Navigator.pop(context);
      String message = errorMessage.response.toString();
      print(message);
    }
  }
}
