import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:geopilot_practice/core/const.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/signUp.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();

}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
   double currentPageValue = 0;
   double vehiclePosition = 0; 

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page ?? 0;
        vehiclePosition = currentPageValue * MediaQuery.of(context).size.width;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPageValue = page.toDouble();
                vehiclePosition = currentPageValue * MediaQuery.of(context).size.width;
              });
            },
            children: [
              OnboardingPage(
                imagePath1:'assets/images/1.1.png',
                imagePath2:'assets/images/2.1.png',
                imagePath: 'assets/images/onimage1.png',
                que: 'Big Family?',
                soln: 'Book a driver to accompany your car and share the ride with your loved ones.',
                nextButtonLabel: 'Next',
                onButtonPressed: () {
                  _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                currentPageValue: currentPageValue,
                top1: 20,
                left1: 0,
                right1: 0,
                bottom1: 0,
                top2: 125,
                left2: 0,
                right2: 0,
                bottom2: 0,
                top: 170,
                left: 0,
                right: 0,
                bottom: 0,
              ),
              OnboardingPage(
               imagePath1:'assets/images/1.2.png',
               imagePath2:'assets/images/2.2.png',
                imagePath: 'assets/images/onimage2.png',
                que: 'Solo Drive?',
                soln: 'Riding solo? Get a driver for your bike and enjoy a hassle-free journey.',
                nextButtonLabel: 'Next',
                backButtonLabel: 'Back',
                onButtonPressed: () {
                  _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                onBackButtonPressed: () {
                  _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                
                currentPageValue: currentPageValue,
                top1: 20,
               left1: 0,
                right1: 0,
                bottom1: 0,
                top2: 125,
                left2: 0,
                right2: 0,
                bottom2: 0,
                top: 250,
                left: 0,
                right: 0,
                bottom: 0,
          
              ),
              OnboardingPage(
              imagePath1:'assets/images/1.3.png',
              imagePath2:'assets/images/2.3.png',
                imagePath: 'assets/images/onimage3.png',
                que: 'Interstate Trips',
                soln: 'Don\'t want to travel long drives? Hire our expert driver, so you can focus on family time instead.',
                nextButtonLabel: 'Get Started',
                backButtonLabel: 'Back',
                onButtonPressed: () {
                  // _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                  Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> SignUpScreen()));
                },
                onBackButtonPressed: () {
                  _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                currentPageValue: currentPageValue,
                top1: 20,
                left1: 0,
                right1: 0,
                bottom1: 0,
                top2: 125,
                left2: 0,
                right2: 0,
                bottom2: 0,
                top: 200,
                left: 0,
                right: 0,
                bottom: 0,
              ),
            ],
          ),
        //  AnimatedPositioned(
        //     duration: Duration(milliseconds: 500),
        //     curve: Curves.ease,
        //     bottom: 150.0,
        //     left: vehiclePosition - 50.0, // Adjust the offset as needed
        //     child: Align(
        //       alignment: Alignment.topCenter,
        //       child: Image.asset(
        //         'assets/images/onimage1.png', // Use the correct asset for Image 1
        //       ),
        //     ),
        //   ),
        ],
      ),
    );
  }
}


class OnboardingPage extends StatelessWidget {
  final double left;
  final double right ;
  final double top;
  final double bottom;
  final String imagePath;
  final String que;
  final String soln;
  final String nextButtonLabel;
  final String? backButtonLabel;
  final VoidCallback onButtonPressed;
  final VoidCallback? onBackButtonPressed;
  final double currentPageValue;
  final String imagePath1;
  final String imagePath2;
  final double left1;
  final double right1 ;
  final double top1;
  final double bottom1;
  final double left2;
  final double right2 ;
  final double top2;
  final double bottom2;
  OnboardingPage({
    required this.imagePath,
    required this.que,
    required this.soln,
    required this.nextButtonLabel,
    this.backButtonLabel,
    required this.onButtonPressed,
    this.onBackButtonPressed,
    required this.currentPageValue,
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
    required this.imagePath1,
    required this.imagePath2,
    required this.left1,
    required this.right1,
    required this.top1,
    required this.bottom1,
    required this.left2,
    required this.right2,
    required this.top2,
    required this.bottom2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Positioned(
          top: top2,
          left: left2,
          bottom: bottom2,
          right: right2,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              imagePath2,
            ),
          ),
        ),
        Positioned(
          top: top1,
          left: left1,
          bottom: bottom1,
          right: right1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              imagePath1,
            ),
          ),
        ),
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
        Positioned(
          bottom: 270.0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              que,
              style: TextStyle(
                fontFamily: 'Montserrat-ExtraBold',
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ), 
            ),
          ),
        ),
        Positioned(
          bottom: 150.0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Text(
                soln,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
         Positioned(
          bottom: 100.0,
          right: 100.0,
          left: 100.0,
          top: 600.0,
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPageValue.toInt(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              color: Colors.black26,
              activeColor: Colors.yellow, // Set the active color here
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),),
         
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              padding:EdgeInsets.symmetric(horizontal: 50.0, vertical: 14.0),
                         backgroundColor: PrimaryCol,
                         shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                           )  ),
            child: Text(nextButtonLabel,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-bold',
              fontSize: 15.0,
                  fontWeight: FontWeight.bold,
    
            ),
            ),
          ),
        ),
    
        if (backButtonLabel != null && onBackButtonPressed != null)
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: TextButton(
      onPressed: onBackButtonPressed,
      style: TextButton.styleFrom(
    primary: Colors.white, // Set the text color here
      ),
      child: Row(
    children: [
      Icon(Icons.arrow_back_ios, color: PrimaryCol), // Add back arrow icon
      SizedBox(width: 8.0), // Add some spacing between the icon and text
      Text(
        backButtonLabel!,
        style: TextStyle(
          color: PrimaryCol,
        ),
      ),
    ],
      ),
    ),
          ),
      ],
    );
  }
}





  // DotsIndicator(
          //   dotsCount: 3,
          //   position: currentPageValue.toInt(),
          //   decorator: DotsDecorator(
          //     size: const Size.square(9.0),
          //     color: Colors.black26,
          //     activeColor: Colors.yellow, // Set the active color here
          //     activeSize: const Size(18.0, 9.0),
          //     activeShape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5.0),
          //     ),
          //   ),
          // ),
