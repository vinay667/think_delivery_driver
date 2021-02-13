import 'package:flutter/material.dart';
import 'package:think_delivery_driver/colors/colors.dart';
import 'package:think_delivery_driver/screens/home_screen.dart';
import 'package:think_delivery_driver/screens/settings_screen.dart';
import 'chat_screen.dart';
import 'earnings_screen.dart';
import 'my_orders_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyOrdersScreen(),
    ChatScreen(),
    EarningsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColor.driverThemeColor,
          unselectedItemColor: Color.fromRGBO(10, 10, 10, 0.7),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5,top: 6),
                child: ImageIcon(AssetImage("images/home_nav.png")),
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5,top: 6),
                child: ImageIcon(AssetImage("images/order_nav.png")),
              ),
              title: Text(
                'Order List',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5,top: 6),
                child: ImageIcon(AssetImage("images/chat_nav.png")),
              ),
              title: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5,top: 6),
                child: ImageIcon(AssetImage("images/earnings_nav.png")),
              ),
              title: Text(
                'Earnings',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),


            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5,top: 6),
                child: ImageIcon(AssetImage("images/set_nav.png")),
              ),
              title: Text(
                'Account',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
