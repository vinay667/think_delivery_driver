
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:think_delivery_driver/colors/colors.dart';
class OrderDetailDelivered extends StatefulWidget
{
  OrderDetailDelState createState()=>OrderDetailDelState();
}
class OrderDetailDelState extends State<OrderDetailDelivered>
{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColor.appBgColor,
      body: Column(

        children: <Widget>[
          SizedBox(height: 50),

          Row(
            children: <Widget>[

              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child:  Padding(
                  padding: EdgeInsets.only(left: 15),
                  child:Icon(Icons.arrow_back_ios,color: MyColor.driverThemeColor,)
                ),
              ),
              SizedBox(width: 15),

              Row(
                children: <Widget>[

                  Text('Order Detail',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'George',
                    fontWeight: FontWeight.w700,
                  )),

                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child:   Text(' (Delivered)',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    )),
                  )
                ],
              ),






            ],
          ),

          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 25),
            //height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: MyColor.appBgColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 14,
                    spreadRadius: 1
                ),
              ],

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 18),
                          child: Text(
                            '#ORD0001',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w900,
                                color: MyColor.defaultTextColor),
                          ),
                        ),

                        SizedBox(height: 10),

                      Row(
                        
                        children: <Widget>[
                          
                          
                          
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Image.asset('images/profile_dc.png',width: 17,height: 17,),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: Text('James',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(48,107,178,1)),
                            ),
                          ),
                        ],
                      ),


                        SizedBox(height: 15),


                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Electronic Items',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w900,
                                color: MyColor.defaultTextColor),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width-120,
                          padding: EdgeInsets.only(left: 10, top: 3),
                          child: Text(
                            'Package short description detailing the package details added the customer displayed here.',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                                color: MyColor.defaultTextColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),




                        SizedBox(height: 15),

                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Package images',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w900,
                                color: MyColor.defaultTextColor),
                          ),
                        ),
                        SizedBox(height: 13),







                      ],
                    ),
                    Container(
                      width: 70,
                      height: 60,
                      transform: Matrix4.translationValues(0.0, -46.0, 0.0),
                      child: Center(
                        child: Text(
                          '\$15',
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
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 15,left: 10),
                        width: 67,
                        height: 67,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1,color: Color.fromRGBO(143,138,138,1))
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset('images/box_dumm.jpg'),
                        )
                    ),


                    Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 67,
                        height: 67,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1,color: Color.fromRGBO(143,138,138,1))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset('images/box_dumm.jpg'),
                        )
                    ),


                    Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 67,
                        height: 67,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1,color: Color.fromRGBO(143,138,138,1))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset('images/box_dumm.jpg'),
                        )
                    ),

                    Expanded(
                      child: Container(

                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.textFiledActiveColor,width: 1)
                          ),
                          child: Center(
                            child: Text(
                              'View More',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 12,
                                  color: Color.fromRGBO(138,197,122,1),
                                  fontWeight: FontWeight.w700


                              ),
                            )
                            ,
                          )

                      ),
                    ),

                    SizedBox(width: 20)

                  ],
                ),
                SizedBox(height: 8),
                Divider(
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),

                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Pickup & Delivery Address',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        color: MyColor.defaultTextColor),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.only(left: 15,top: 15),
                  child: Row(
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
                          SizedBox(height: 17,)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Ordered:',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                      color: MyColor.defaultTextColor),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'July 8th 2020',
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
                            Text(
                              '64 Momingview Lane, New York',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(40, 43, 47, 0.7)),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Text(
                                  'To:',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                      color: MyColor.defaultTextColor),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'July 8th 2020',
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
                            Text(
                              '64 Momingview Lane, New York',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(40, 43, 47, 0.7)),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 12)
              ],
            ),
          ),


          Expanded(
            child: Container(
            ),
          ),




          Container(
            height: 55,
            width: double.infinity,
            color: MyColor.driverThemeColor,
            child: Center(
              child: Text(
                'START DELIVERY',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),


          ),


          SizedBox(height: 20,)







        ],
      ),


    );
  }




  showRateDriverDialog() {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return StatefulBuilder(
          builder: (context,setState)

          {
            return Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
                          ),
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[


                              Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22,right: 15),
                                      child: Image.asset('images/cross_rect.png',width: 25,height: 25),
                                    ),
                                  )
                              ),


                              SizedBox(height: 5),

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: <Widget>[

                                 Container(
                                     width: 60,
                                     height: 60,
                                     margin: EdgeInsets.only(right: 15),
                                     decoration:  BoxDecoration(
                                         shape: BoxShape.circle,
                                         image: DecorationImage(
                                             fit: BoxFit.fill,
                                             image:  AssetImage('images/driver_dummy.jpg')
                                         )
                                     )
                                 ),
                                 SizedBox(height: 10),



                                 Text(
                                   'Jason Holder',
                                   style: TextStyle(
                                       fontSize: 14,
                                       fontFamily: 'OpenSans',
                                       fontWeight: FontWeight.w700,
                                       color: MyColor.defaultTextColor),
                                 ),

                                 SizedBox(height: 11),
                                 
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: <Widget>[
                                     
                                     Image.asset('images/rating_fill.png',width: 17,height: 17),

                                     SizedBox(width: 5),

                                     Image.asset('images/rating_fill.png',width: 17,height: 17),

                                     SizedBox(width: 5),

                                     Image.asset('images/rating_fill.png',width: 17,height: 17),
                                     SizedBox(width: 5),

                                     Image.asset('images/rating_fill.png',width: 17,height: 17),


                                     SizedBox(width: 5),

                                     Image.asset('images/rating_empty.png',width: 17,height: 17)


                                     
                                     
                                   ],
                                 ),
                                 SizedBox(height: 15),
                                 
                                 


                               ],
                             ),
                              SizedBox(height: 5),
                           Padding(
                             padding: EdgeInsets.only(left: 20,right: 20),
                             child:   Divider(
                               color: Colors.black12.withOpacity(0.2),
                             ),

                           ),

                              SizedBox(height: 17),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child:   Text('Thank you driver with a tip',style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'George',
                                  fontWeight: FontWeight.w700,
                                )),
                              ),



                              SizedBox(height: 20),

                             Row(
                               children: <Widget>[

                                 Container(
                                   width: 90,
                                   height: 50,
                                   margin: EdgeInsets.only(left: 20),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                       border: Border.all(color: MyColor.themeColorRed,width: 1.8)
                                   ),
                                   child: Center(
                                     child: Text('No tip',style: TextStyle(
                                       fontSize: 17,
                                       color: MyColor.themeColorRed,
                                       fontFamily: 'OpenSans',
                                       fontWeight: FontWeight.w700,
                                     )),
                                   ),



                                 ),

                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 18),
                                     height: 50,
                                     child: ListView.builder(
                                         itemCount: 4,
                                         scrollDirection: Axis.horizontal,
                                         itemBuilder: (BuildContext context,int pos)
                                         {
                                           return  Row(
                                             children: <Widget>[
                                               Container(
                                                 width: 70,
                                                 height: 50,
                                                 decoration: BoxDecoration(
                                                   color: pos==2?MyColor.textFiledActiveColor:Colors.white,
                                                     borderRadius: BorderRadius.circular(15),
                                                     border: Border.all(color: MyColor.textFiledActiveColor,width: 1)
                                                 ),
                                                 child: Center(
                                                   child: Text('\$2',style: TextStyle(
                                                     fontSize: 17,
                                                     color: pos==2?Colors.white:MyColor.textFiledActiveColor,
                                                     fontFamily: 'OpenSans',
                                                     fontWeight: FontWeight.w700,
                                                   )),
                                                 ),



                                               ),
                                               SizedBox(width: 18)
                                             ],
                                           );

                                         }

                                     ),
                                   ),
                                 )


                               ],
                             ),

                              Padding(
                                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                                child:   Divider(
                                  color: Colors.black12.withOpacity(0.2),
                                ),

                              ),




                              SizedBox(height: 20),



                              Container(
                                height: 58,
                                margin: EdgeInsets.only(left: 20,right: 20),
                                //color: Colors.pink,
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w700),
                                  decoration: new InputDecoration(
                                    labelText: 'Please specify',
                                    labelStyle: TextStyle(
                                      color:Color.fromRGBO(40,43,47,0.25),
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                    //  contentPadding: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 20),
                                    //contentPadding: EdgeInsets.all(20),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),

                              SizedBox(height: 40),


                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child:  Container(
                                  width: double.infinity,
                                  height: 60,
                                  color: Color.fromRGBO(187, 49, 44, 1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Review & Pay',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                      ),
                                      SizedBox(width: 10),
                                      /* Image.asset(
            'images/arrow_right.png',
            width: 25,
            height: 15,
          )*/
                                    ],
                                  ),
                                ),
                              )




                            ],
                          ),
                        )


                    ),
                  ],
                )
            );
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
}