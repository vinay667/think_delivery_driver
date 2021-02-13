import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/network/no_internet_check.dart';
import 'package:think_delivery_driver/widgets/btn_widget_blank.dart';
import 'package:toast/toast.dart';

class HomeTab1 extends StatefulWidget {
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab1> {
  bool isLoading=true;
  List<dynamic> orderList=[];
  String driverID;
  var _fromData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading==true?
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Center(
            child: CircularProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(MyColor.driverThemeColor),
            ),
          )
      ):

      ListView.builder(
          itemCount: orderList.length,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int position) {
            return InkWell(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailDelivered()));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 12, right: 12, top: position == 0 ? 25 : 0),
                      //height: 210,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              blurRadius: 8,
                              spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(250, 250, 255, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 18),
                                      child: Text(
                                        orderList[position]['booking_id'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w900,
                                            color: MyColor.defaultTextColor),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 3),
                                      child: Text(
                                         orderList[position]['package_description']??'Description not available',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600,
                                            color: MyColor.defaultTextColor),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 60,
                                transform:
                                    Matrix4.translationValues(0.0, -7.0, 0.0),
                                child: Center(
                                  child: Text(

                                    orderList[position]['final_amount']==null?
                                     '\$0':
                                    '\$'+ orderList[position]['final_amount'].toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'George',
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(187, 49, 44, 1)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(
                            color: Color.fromRGBO(221, 221, 221, 1),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Image.asset('images/locv_red.png',
                                            width: 15, height: 15),
                                        Dash(
                                            direction: Axis.vertical,
                                            length: 40,
                                            dashLength: 4,
                                            dashColor: MyColor.themeColorRed),
                                        Image.asset('images/locv_red.png',
                                            width: 15, height: 15),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'From:',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        206, 206, 206, 1)),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                getFormatDate(orderList[position]['pickup_date_time'].toString()),
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        48, 107, 178, 1)),
                                              ),
                                            ],
                                          ),
                                          //width: MediaQuery.of(context).size.width * 0.50,

                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.50,
                                            child:   Text(
                                              orderList[position]['s_address'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      40, 43, 47, 0.7)),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'To:',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        206, 206, 206, 1)),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                orderList[position]['estimated_del_date']!=null?getFormatDate(orderList[position]['estimated_del_date']):'NA',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                    color: Color.fromRGBO(
                                                        48, 107, 178, 1)),
                                              ),
                                            ],
                                          ),

                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.50,
                                            child: Text(
                                              orderList[position]['d_address'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      40, 43, 47, 0.7)),  maxLines: 1,
                                              overflow: TextOverflow.ellipsis,

                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap:(){

                                      updateOrderStatus(context,orderList[position]['id'],'CANCELLED');

                                    },
                                    child: ButtonWithBorder2(
                                        'Reject', MyColor.themeColorRed),
                                  ),
                                  flex: 1,
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child:InkWell(
                                    onTap: (){
                                      updateOrderStatus(context,orderList[position]['id'],'ACCEPTED');
                                    },
                                    child:  ButtonWithBorder3(
                                        'Accept', MyColor.driverThemeColor),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ));
          }),
    );
  }

  String getFormatDate(String date)
  {
    DateTime dateTime = DateTime.parse(date.toString());
    final DateFormat timeFormatter = DateFormat.yMMMEd();
    String timeAsString = timeFormatter.format(dateTime);
    print(timeAsString);
    return timeAsString;
  }

  fetchUserOrders() async {
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.get('driveracceptall', context);
    print(response);
    setState(() {
      isLoading=false;
      orderList=response['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetAPIcall();
    _fromData = {
      'order_id': '',
      'driver_id': UserModel.userId,
      'status':'',
    };



  }

  updateOrderStatus(BuildContext context,int orderID,String status) async {
    _fromData["order_id"]=orderID.toString();
    _fromData["status"]=status;
    _fromData["driver_id"]=driverID;
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPIWithHeader(
        'driveraccept',
        _fromData,
        context);
    print(response);
    Navigator.pop(context);

     if(response['success'])
       {
         if(status=='ACCEPTED')
         {
           Toast.show(response['message'], context,
               duration: Toast.LENGTH_LONG,
               gravity: Toast.BOTTOM,
               backgroundColor: Colors.black);
         }
         else{
           Toast.show('Order Rejected Successfully !!', context,
               duration: Toast.LENGTH_LONG,
               gravity: Toast.BOTTOM,
               backgroundColor: Colors.black);
         }
       }
  }
  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      _fetchDriverIDAsString();
      fetchUserOrders();

    }
  }


  _fetchDriverIDAsString()
  async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    driverID=prefs.getString('id');

  }

}
