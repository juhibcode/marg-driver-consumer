import 'package:flutter/material.dart';
import 'package:geopilot_practice/core/const.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/signUp.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/onboardingscreen/onboardingscreen.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/sigIn.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/HomeScreen.dart';


void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PrimaryCol,
        secondaryHeaderColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Montserrat-Bold', 
          ),
          // You can customize other text styles as needed
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'onboarding_screen',
      routes: {
        //Splash Screen (Aryan) 
        'signup_screen': (context) => SignUpScreen(),
        'login_screen': (context) => SigIn_Screen(),
        'home_screen': (context) => HomeScreen(),
        'onboarding_screen': (context) => OnboardingScreen(),
      },
    );
  }
}
