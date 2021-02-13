import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/network/api_dialog.dart';
import 'package:think_delivery_driver/network/api_helper.dart';
import 'package:think_delivery_driver/network/no_internet_check.dart';
import 'package:think_delivery_driver/screens/earnings_detail.dart';
class EarningsScreen extends StatefulWidget
{
  EarningsScreenState createState()=>EarningsScreenState();
}
class EarningsScreenState extends State<EarningsScreen>
{
  List<dynamic> earningsList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyColor.appBgColor,
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              height: 240,
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
                  Text(
                    'My Earning',
                    style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'George',
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      '\$47.474',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'George',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 25),

                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        width: 85,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5,color: Color.fromRGBO(250,250,255,1
                            )),
                            borderRadius: BorderRadius.circular(7)),

                        child:  Center(
                          child: Text(
                            'Week',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(249,249,254,1)),
                          ),
                        )
                      ),

                      SizedBox(width: 20),

                      Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                             color: Colors.white,
                              border: Border.all(width: 0.5,color: Color.fromRGBO(250,250,255,1
                              )),
                              borderRadius: BorderRadius.circular(7)),

                          child:  Center(
                            child: Text(
                              'Month',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.driverThemeColor),
                            ),
                          )
                      ),


                      SizedBox(width: 20),


                      Container(
                          width: 65,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5,color: Color.fromRGBO(250,250,255,1
                              )),
                              borderRadius: BorderRadius.circular(7)),

                          child:  Center(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(249,249,254,1)),
                            ),
                          )
                      ),







                    ],
                  )






                ],
              )),

          SizedBox(height: 20),



          Row(
            children: <Widget>[

              Expanded(
                child: Container(
                  height: 57,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Color.fromRGBO(40, 43, 47, 1),
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans'),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon:Padding(
                        padding: EdgeInsets.only(top: 17,bottom: 17,right: 10,left: 15),
                        child:  Image.asset('images/search_ic2.png',color: Color.fromRGBO(45,48,52,0.3
                        )),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(40, 43, 47, 0.2),
                          fontSize: 17),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromRGBO(0,0,0,0.53), width: 1.5)),
                ),
              ),

              Container(
                width: 60,
                height: 57,
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5,color: Color.fromRGBO(48,107,178,1)),
                    borderRadius: BorderRadius.circular(10)),
              child: Image.asset('images/filter_ic.png'),


              ),

              SizedBox(width: 15)



            ],
          ),

        // /  SizedBox(height: 25),


          Expanded(
            child: ListView.builder(
             // padding: EdgeInsets.zero,
              itemCount: earningsList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int pos)
            {
              return Column(
                children: <Widget>[


                 InkWell(
                   onTap:(){

                     Navigator.push(context, MaterialPageRoute(builder: (context)=>EarningsDetailScreen(earningsList[pos]['id'])));
              },
                   child:  Container(
                       padding: EdgeInsets.only(top: 15,bottom: 21,left: 15,right: 15),
                       margin: EdgeInsets.only(left: 15,right: 15),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         color: Colors.white,
                         boxShadow: <BoxShadow>[
                           BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               blurRadius: 14,
                               spreadRadius: 1
                           ),
                         ],

                       ),
                       // height: 100,
                       child: Column(

                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[

                           Row(
                             children: <Widget>[

                               Text(
                                 getFormatDate(earningsList[pos]['updated_at']),
                                 style: TextStyle(
                                     fontSize: 11,
                                     fontFamily: 'OpenSans',
                                     fontWeight: FontWeight.w600,
                                     fontStyle: FontStyle.italic,
                                     color: Color.fromRGBO(
                                         48, 107, 178, 1)),
                               ),



                               Expanded(
                                 child: Container(),
                               ),


                               Text(
                                 '\$'+earningsList[pos]['driver_commision'].toString(),
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontFamily: 'George',
                                     fontWeight: FontWeight.w600,
                                     color: Color.fromRGBO(187, 49, 44, 1)),
                               ),

                             ],
                           ),


                           Text(
                             '#ORD00'+earningsList[pos]['id'].toString(),
                             style: TextStyle(
                                 fontSize: 16,
                                 fontFamily: 'OpenSans',
                                 fontWeight: FontWeight.w900,
                                 color: MyColor.defaultTextColor),
                           ),

                           SizedBox(height: 20),

                           Row(children: <Widget>[

                             Text(
                               'Package Delivered from ',
                               style: TextStyle(
                                   fontSize: 11,
                                   fontFamily: 'OpenSans',
                                   fontWeight: FontWeight.w600,
                                   color: MyColor.defaultTextColor),
                             ),


                             Text(
                               earningsList[pos]['customer_name']!=null?earningsList[pos]['customer_name']:'NA',
                               style: TextStyle(
                                   fontSize: 11,
                                   fontFamily: 'OpenSans',
                                   fontWeight: FontWeight.w600,
                                   color: MyColor.driverThemeColor),
                             ),

                           ],)




                         ],
                       )

                   ),
                 ),
                  SizedBox(height: 20)
                ],
              );
            }

            ),
          )






        ],
      ),


    );
  }




  getDriverEarnings() async {

    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.get('driverorderslist', context);
    Navigator.pop(context);
    print(response);
    setState(() {
    earningsList=response['data'];
    });
  }
  String getFormatDate(String date)
  {
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


