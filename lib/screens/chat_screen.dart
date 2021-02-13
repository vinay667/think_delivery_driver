

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/widgets/chat_list_item.dart';

class ChatScreen extends StatefulWidget {
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.appBgColor,
        body:Padding(
          padding: EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                 // padding: EdgeInsets.only(left: 15,right: 15),
                  width: double.infinity,
                  height: 141,
                  decoration: BoxDecoration(
                    color: MyColor.driverThemeColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                  ),

                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[


                      SizedBox(height: 70),

                     
                    
                      
                      Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //Container(),
                         Expanded(
                           child: Center(
                             child: Text(
                               'Message',
                               style: TextStyle(
                                   fontSize: 21,
                                   fontFamily: 'George',
                                   fontWeight: FontWeight.w700,
                                   color: Colors.white),
                             ),
                           )


                         ),
                         /* Expanded(
                            child: Container(),
                          ),*/
                          
                          Image.asset('images/search_ic2.png',width: 24,height: 24),


                          SizedBox(width: 20),

                          
                          
                          
                          
                          
                          
                        ],
                      ),
                      SizedBox(height: 5),







                    ],
                  )



              ),
              SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                    itemCount: 9,
                    padding: EdgeInsets.only(left: 15,right: 15),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int position) {
                      return ChatListItem(position);
                    }),
              )



            ],
          ),
        )




    );

  }





}
