import 'package:flutter/material.dart';
import 'package:geopilot_practice/core/const.dart';
import 'package:geopilot_practice/presentation_layer/pages/page/accountpage.dart';
import 'package:geopilot_practice/presentation_layer/pages/page/servicespage.dart';
import 'package:geopilot_practice/presentation_layer/pages/page/travelpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,  this.name});

  final String? name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

    int currentTab=0;
    final List<Widget> screens=[
      HomeScreen(),
      Services(),
      Travel(),
      Account()
    ];
    final PageStorageBucket bucket=PageStorageBucket();
    Widget currentScreen=HomeScreen();

  final homeNavKey = GlobalKey<NavigatorState>();
  final serviceNavKey = GlobalKey<NavigatorState>();
  final travelNavKey = GlobalKey<NavigatorState>();
  final accountNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Image.asset('assets/icons/Menu.png'),
        onPressed: () {
        },
      ),  
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopScope (
            canPop: false,
            onPopInvoked: (bool didPop){
              if(didPop){
                return;
              }
              _showBackDialog();
            },
            child:Container(), ),
          Text(
            'Hello!',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat-ExtraBold',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.name!,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat-Regular',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/icons/bell2.png'),
          onPressed: () {
          },
        ),
        IconButton(
          icon: Image.asset('assets/icons/cog.png'),
          onPressed: () {
          },
        ),
      ],
      elevation: 1,
    ),
    body: PageStorage(
      bucket: bucket,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/driversbackground.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 65.0, vertical: 10.0),
                            backgroundColor: PrimaryCol,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )
                        ),
                        child: const Text('Hire Driver',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat-Bold',
                            ))),
                  ),
                ],
              ),
              SizedBox(height: 23,),
              Text('Hire by Vehicle',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                ),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/images/Frame 1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/images/Frame 2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 23,),
              const Text('Festival Delight',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                ),),
              SizedBox(height: 10,),
              Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/diwalioffer.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 120,
                            bottom: 5,
                            right: 220,
                            left: 15,
                            child: ElevatedButton(
                                onPressed: () {},
                                // other button properties
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0, vertical: 2.0),
                                    backgroundColor: Color(0xFF16885F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0),
                                    )
                                ),
                                child: const Text('Hire Driver',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montser vrat-Bold',
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text('Our Services',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                ),),
              SizedBox(height: 8,),
              Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            // Your onTap logic
                          },
                          iconSize: 100,
                          icon: Image.asset('assets/images/insurance.png')
                      ),
                      SizedBox(height: 5,),
                      Text('Insurance',
                        style: TextStyle(
                          color: SecondryCol,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold',
                        ),),
                    ],
                  ),
                  SizedBox(width: 7,),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            // Your onTap logic
                          },
                          iconSize: 100,
                          icon: Image.asset('assets/images/FASTag.png')
                      ),
                      SizedBox(height: 5,),
                      Text('FASTag',
                        style: TextStyle(
                          color: SecondryCol,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold',
                        ),),
                    ],
                  ),
                  SizedBox(width: 7,),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFfff5d0),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Your onTap logic
                          },
                          iconSize: 100,
                          icon: Image.asset('assets/images/Refer&earn.png',),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Text('Refer & Earn',
                        style: TextStyle(
                          color: SecondryCol,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold',
                        ),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 25,),
              Text('Driver of the Month',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                ),),
              SizedBox(height: 10,),
              Image.asset('assets/images/bestdriver.png'),
            ],
          ),
        ),
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation:8,
          onPressed: (){
           },
          backgroundColor: PrimaryCol,
          heroTag: null,
          mini: false,
         child:Image.asset('assets/images/cap.png',
         )
       ),
    
    bottomNavigationBar:BottomAppBar(
                  elevation: 0,
        child: ClipRect(
           child:Container(
            height: 60,
            color: Colors.white,
               child: Row(
                 children: [
                   Row(
                     children: [
                       MaterialButton(
                         onPressed: () {
                           navigateToTab(0);
                         },
                         child: buildNavBarItem(0, Icons.home_filled, 'Home'),
                       ),
                       MaterialButton(
                         onPressed: () {
                           navigateToTab(1);
                         },
                         child: buildNavBarItem(1, Icons.handshake_rounded, 'Services'),
                       ),
                       SizedBox(width: 8,),
                       MaterialButton(
                         onPressed: () {
                           navigateToTab(2);
                         },
                         child: buildNavBarItem(2, Icons.mode_of_travel_rounded, 'Travel'),
                       ),
                       MaterialButton(
                         onPressed: () {
                           navigateToTab(3);
                         },
                         child: buildNavBarItem(3, Icons.account_circle_rounded, 'Account'),
                       ),
                      
                     ],
    
    ),
                 ],
               )
           )
        )
    )
    
    );
  }
  Widget buildNavBarItem(int tabIndex, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: currentTab == tabIndex ? PrimaryCol : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            color: currentTab == tabIndex ? PrimaryCol : Colors.grey,
            fontFamily: 'Montserrat-ExtraBold',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void navigateToTab(int tabIndex) {
    setState(() {
      currentScreen = screens[tabIndex];
      currentTab = tabIndex;
    });
  }
}



