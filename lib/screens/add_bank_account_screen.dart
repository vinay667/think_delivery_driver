import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/network/no_internet_check.dart';
import 'package:think_delivery_driver/widgets/input_field_widget2.dart';
import 'package:toast/toast.dart';

class AddAccountScreen extends StatefulWidget {
  AddAccountState createState() => AddAccountState();
}

class AddAccountState extends State<AddAccountScreen> {
  var textControllerHolderName = new TextEditingController();
  var textControllerNumber = new TextEditingController();
  var textControllerRoutingNumber = new TextEditingController();
  var _fromData;
  int bankID;
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
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'images/arrow_left.png',
                  width: 25,
                  height: 25,
                ),
              ),
              SizedBox(width: 15),
              Text(
                'Bank Account',
                style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'George',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(53, 52, 89, 1)),
              ),
              Expanded(
                child: Container(),
              ),


              InkWell(
                onTap: (){
                  if(bankID==null)
                    {
                      addBankDetails(context);
                    }
                  else{
                    updateBankDetails(context);
                  }

                },
                child:  Container(
                  width: 70,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MyColor.driverThemeColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'SAVE',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 12,
                          ))
                    ],
                  ),
                ),
              ),


              SizedBox(width: 20)
            ],
          ),

          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Bank Details',
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'George',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(53, 52, 89, 0.4)),
            ),
          ),

          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DriverInputBoxWidget2(
              labelText: 'Account Holder Name',
              hintText: 'Enter Name',
              controller: textControllerHolderName,
            ),
          ),

          //SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DriverInputBoxWidget2(
              labelText: 'Account Number',
              hintText: 'Account Number',
              controller: textControllerNumber,
              isNumeric: true,

            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DriverInputBoxWidget2(
              labelText: 'Routing Number',
              hintText: 'Routing Number',
              controller: textControllerRoutingNumber,
            ),
          ),
        ],
      ),
    );
  }




  fetchUserAccounts() async {
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.get('driverbankdetail', context);
    Navigator.pop(context);
    print(response);


    if(response['data']=='null')
      {
        Toast.show('No Bank account found !!', context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
        _fromData = {
          'account_holder_name': '',
          'account_number': '',
          'routing_number':'',
          'user_id':UserModel.userId,
        };

      }
    else
      {
        setState(() {

          textControllerHolderName.text=response['data']['account_holder_name'];
          textControllerNumber.text=response['data']['account_number'].toString();
          textControllerRoutingNumber.text=response['data']['routing_number'].toString();

        });
        bankID=response['data']['bank_id'];
        _fromData = {
          'account_holder_name': '',
          'account_number': '',
          'routing_number':'',
          'user_id':UserModel.userId,
          'bank_id':bankID
        };


      }
  }



  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      fetchUserAccounts();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetAPIcall();

  }


  addBankDetails(BuildContext context) async {
    _fromData["account_holder_name"]=textControllerHolderName.text;
    _fromData["account_number"]=textControllerNumber.text;
    _fromData["routing_number"]=textControllerRoutingNumber.text;
    FocusScope.of(context).unfocus();
    print(_fromData);
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPIWithHeader(
        'driveraddbank',
        _fromData,
        context);
    Navigator.pop(context);
    print(response);
    if(response['success'])
    {
      Navigator.pop(context);
      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }
    else{

      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }
  }



  updateBankDetails(BuildContext context) async {
    _fromData["account_holder_name"]=textControllerHolderName.text;
    _fromData["account_number"]=textControllerNumber.text;
    _fromData["routing_number"]=textControllerRoutingNumber.text;
    print(_fromData);
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPIWithHeader(
        'driverupdatebank',
        _fromData,
        context);
    Navigator.pop(context);
    print(response);
    if(response['success'])
      {
          Navigator.pop(context);
        Toast.show(response['message'], context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
      }
    else{

      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }



  }
}
