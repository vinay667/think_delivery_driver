import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/network/no_internet_check.dart';
import 'package:think_delivery_driver/widgets/earnings_widget.dart';

class EarningsDetailScreen extends StatefulWidget {
  final int orderID;
  EarningsDetailScreen(this.orderID);
  EarningsDetailState createState() => EarningsDetailState(orderID);
}

class EarningsDetailState extends State<EarningsDetailScreen> {
  final int orderID;
  EarningsDetailState(this.orderID);
  String totalPayout='0',adminFee='0',deliveryFare='0';
  String customerName='',delDate='',location='';


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
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          )),
                      SizedBox(width: 15),
                      Text(
                        'Robert Smith',
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'George',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      '\$'+totalPayout.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'George',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      '(Total Payout Sent to Bank Account)',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
          SizedBox(height: 30),
          Container(
              padding:
              EdgeInsets.only(top: 15, bottom: 18, left: 15, right: 15),
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 14,
                      spreadRadius: 1),
                ],
              ),
              // height: 100,
              child: Column(
                children: <Widget>[
                  EarningsWidget('Package Delivery Fare:', '\$'+deliveryFare.toString()),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Administration Fee (30%):',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: MyColor.defaultTextColor),
                      ),
                      Text(
                        '\$'+adminFee.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'George',
                            fontWeight: FontWeight.w600,
                            color: MyColor.defaultTextColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total Payout:',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w900,
                            color: MyColor.defaultTextColor),
                      ),
                      Text(
                        '\$'+totalPayout.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'George',
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(216, 73, 58, 1)),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Order Details',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'George',
                  fontWeight: FontWeight.w700,
                  color: MyColor.defaultTextColor),
            ),
          ),
          SizedBox(height: 15),
          Container(
              padding:
              EdgeInsets.only(top: 15, bottom: 18, left: 15, right: 15),
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 14,
                      spreadRadius: 1),
                ],
              ),
              // height: 100,
              child: Column(
                children: <Widget>[
                  EarningsWidget('Order ID:', '#ORD000'+orderID.toString()),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: 10),
                  EarningsWidget('Customer Name:', customerName==null?'NA':customerName),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: 10),
                  EarningsWidget('Order Delivery Date:', delDate==''?'':getFormatDate(delDate)),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(
                        'Delivery Location:',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: MyColor.defaultTextColor),
                      ),



                     Expanded(
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         child:  Text(
                           location,
                           style: TextStyle(
                               fontSize: 14,
                               fontFamily: 'George',
                               fontWeight: FontWeight.w600,
                               color: MyColor.defaultTextColor),
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                         ),
                       )

                     )







                    ],
                  ),

                ],
              )),
        ],
      ),
    );
  }

  getDriverEarnings() async {
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.get('driverorderdetail/$orderID', context);
    Navigator.pop(context);
    print(response);
    setState(() {
    deliveryFare=response['data']['package_delivery_fare'].toString();
    adminFee=response['data']['administrative_fee'].toString();
    totalPayout=response['data']['total_payment'].toString();
    delDate=response['data']['order_delivery_date'];
    location=response['data']['order_delivery_location'];
    customerName=response['data']['customer_name'];




    });
  }

  String getFormatDate(String date) {
    DateTime dateTime = DateTime.parse(date.toString());
    final DateFormat timeFormatter = DateFormat.yMMMEd();
    String timeAsString = timeFormatter.format(dateTime);
    print(timeAsString);
    return timeAsString;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkInternetAPIcall();
  }


  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      getDriverEarnings();
    }
  }
}