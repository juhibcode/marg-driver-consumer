import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:geopilot_practice/core/const.dart';
import 'dart:async';
import 'signUp.dart';
import 'HomeScreen.dart';
import 'package:geopilot_practice/domain_layer/usecases/signin.dart';
import 'package:geopilot_practice/domain_layer/repositories_impl/fetch_repo_contract.dart';
import 'package:geopilot_practice/data_layer/repositories/auth_repository.dart';
import 'package:geopilot_practice/data_layer/datasource/datasource.dart';

class EnterOTP extends StatefulWidget {
  final String mobileNumber;
  final String? Nameid;
  const EnterOTP({Key? key, required this.mobileNumber, this.Nameid}) : super(key: key);
 
  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  String enteredOTP = '';
  late final SignInRepository signInRepository;
late final SignIncase signInCase;
late final SignUpRepository signUpRepository;
late final SignUpcase signUpCase;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
    SignInRemoteDataSource remoteDataSource = SignInRemoteDataSource('https://marg-drive-dev-server.onrender.com');
    signInRepository = SignInRepositoryImpl(remoteDataSource); 
    signInCase = SignIncase(signInRepository);

    SignUpRemoteDataSource remoteDataSourcep =SignUpRemoteDataSource('https://marg-drive-dev-server.onrender.com');
    signUpRepository = SignUpRepositoryImpl(remoteDataSourcep);
    signUpCase = SignUpcase(signUpRepository);
  }
  Future<void> verifySignin( String phone, String otp) async {
    // try {
    //   final response = await http.post(
    //     Uri.parse('http://localhost:5000/api/v1/userAuth/verifySigninOtp'),
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode({
    //       'name': name,
    //       'phone': phone,
    //       'otp': otp,
    //     }),
    //   );
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');

    //   if (response.statusCode == 200) {
    //   print('Successful OTP verification');
    //   Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));

    //   } else {
    //     // Handle verification failure
    //     print('Failed OTP verification');
    //   }
    // } catch (e) {
    //   print(e.toString());
    // }
    try{
     final response = await signInCase.verifySignInOtp(phone, otp);

if (response.isRight()) {
  if (widget.mobileNumber == phone && enteredOTP == otp) {
    print('successful OTP verification');
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  } else {
    print('Invalid mobile number or OTP');
  }
} else {
  print('Failed OTP verification: ${response.leftMap((l) => l.toString())}');
}
      
  }catch (e) {
      print('Error during sign-in: $e');
    }}


  Future<void> verifySignup(String name, String phone, String otp) async {
  try {
    final response = await signUpCase.verifySignUpOtp(name, phone, otp);

    if (response.isRight()) {
      if (widget.Nameid == name && widget.mobileNumber == phone && enteredOTP == otp) {
        print('Successful OTP verification');
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(name: name)));
      } else {
        print('Invalid name, mobile number, or OTP');
      }
    } else {
      print('Failed OTP verification: ${response.leftMap((l) => l.toString())}');
    }
  } catch (e) {
    print('Error during sign-up OTP verification: $e');
  }
}




  late String phoneNumber;
  late Timer _timer;
  int _secondsRemaining = 30;



  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: PrimaryCol,
      ),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius:BorderRadius.circular(20) ,
          border: Border.all(color: Colors.grey)
      ),
    );

    return Scaffold(
      body:   SingleChildScrollView(
          padding:  EdgeInsets.all(20),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SkipButton,
                  ),
                ],
              ),
              const Text('We have sent',
              style:  TextStyle(  //Headline Text Style
                fontFamily: 'Montserrat-ExtraBold',
                color: PrimaryCol,
                fontSize: 32.0,
                fontWeight:FontWeight.w700 ,
              ),),
              const Text('you a 4 Digit',
              style: TextStyle(  //Headline Text Style
                fontFamily: 'Montserrat-ExtraBold',
                color: PrimaryCol,
                fontSize: 32.0,
                fontWeight:FontWeight.w700 ,
              )),
              const Text('Code.',
              style:  TextStyle(  //Headline Text Style
                fontFamily: 'Montserrat-ExtraBold',
                color: PrimaryCol,
                fontSize: 32.0,
                fontWeight:FontWeight.w700 ,
              ),),
              const SizedBox(height: 10,),
              const Text('Step In and Explore: Log In to',
                style: TextStyle(
                  color: SecondryCol,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat-ExtraBold',
                  fontWeight:FontWeight.w500,
                ),
              ),
              const Text('Your Journey!',
                style: TextStyle(
                  color: SecondryCol,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat-ExtraBold',
                  fontWeight:FontWeight.w500,
                ),),
              const SizedBox(height: 50,),
              const Align(
                alignment: Alignment.center,
                child: Text('Enter OTP',
                  style: TextStyle(
                    color: PrimaryCol,
                    fontSize: 16.0,
                    fontWeight:FontWeight.bold,
                  ),),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('OTP sent to ',
                    style: TextStyle(
                      color: SecondryCol,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat-ExtraBold',
                      fontWeight:FontWeight.w500,
                    ),),
                   Text(widget.mobileNumber,
                    style: const TextStyle(
                      color: SecondryCol,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat-ExtraBold',
                      fontWeight:FontWeight.w500,
                    ),),
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      ' (change)',
                      style: TextStyle(
                        color: PrimaryCol,
                        fontSize: 15.0,
                        fontFamily: 'Montserrat-ExtraBold',
                        fontWeight:FontWeight.w700,
                      ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height:20),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Pinput(
                    length: 4,
                    controller: otpController,
                    defaultPinTheme:defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
    border: Border.all(color:PrimaryCol),
    ),
    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(
                    color: PrimaryCol,
                    fontSize: 16.0,
                    fontFamily: 'Montserrat-ExtraBold',
                    fontWeight:FontWeight.w700,
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Time remaining: $_secondsRemaining ',
                    style: const TextStyle(
                      color: SecondryCol,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat-ExtraBold',
                      fontWeight:FontWeight.w500,
                    ),),

                 const  Text('Seconds',
                    style: TextStyle(
                      color: SecondryCol,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat-ExtraBold',
                      fontWeight:FontWeight.w500,
                    ),),
                ],
              ),
              const SizedBox(height: 180,),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                     onPressed: () async {
                       try {
                        enteredOTP = otpController.text;
                        String nameId = widget.Nameid ?? ""; 
                        if (nameId.isEmpty) {
                        print('in');
                        await verifySignin(widget.mobileNumber, enteredOTP);
                        } else {
                       print('up');
                        await verifySignup(nameId, widget.mobileNumber, enteredOTP);
                        }
                         } catch (e) {
                        print('Exception in onPressed: $e');
                         }
                        },
                      // other button properties
                    style: ElevatedButton.styleFrom(
                        padding:const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
                        backgroundColor: PrimaryCol,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                    ),
                    child: const Text('Verify',
                        style: TextStyle(fontSize: 21.0))),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>SignUpScreen()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: PrimaryCol,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
      )
    );
  }
}