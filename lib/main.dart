import 'package:flutter/material.dart';
import 'package:think_delivery_driver/screens/splash_screen.dart';

import 'model/user_model.dart';
import 'network/Utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String token = await MyUtils.getSharedPreferences('access_token') ?? null;
  print(token);
  if(token!=null)
  {
    String userID = await MyUtils.getSharedPreferences('id');
    UserModel.setAccessToken(token);
    UserModel.setUserId(userID);
  }
  else{
    UserModel.setAccessToken(null);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

