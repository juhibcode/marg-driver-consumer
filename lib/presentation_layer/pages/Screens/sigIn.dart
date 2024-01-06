import 'package:flutter/material.dart';
import 'package:geopilot_practice/core/const.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/enterOTP.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/signUp.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/privacy&terms/Terms&Condition.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/privacy&terms/privacyPoilcy.dart';
import 'package:geopilot_practice/domain_layer/usecases/signin.dart';
import 'package:geopilot_practice/data_layer/repositories/auth_repository.dart';
import 'package:geopilot_practice/data_layer/datasource/datasource.dart';
import 'package:geopilot_practice/domain_layer/repositories_impl/fetch_repo_contract.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class SigIn_Screen extends StatefulWidget {

  @override
  State<SigIn_Screen> createState() => _SigIn_ScreenState();
}

class _SigIn_ScreenState extends State<SigIn_Screen> {
late final SignInRepository signInRepository;
late final SignIncase signInCase;

  String phoneNumber = '';
  TextEditingController numberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isChecked=false;
  bool _isLoading=false;

@override
  void initState() {
    super.initState();
    SignInRemoteDataSource remoteDataSource = SignInRemoteDataSource('https://marg-drive-dev-server.onrender.com');
    signInRepository = SignInRepositoryImpl(remoteDataSource); 
    signInCase = SignIncase(signInRepository);
  }


  Future<void> signin(String phone) async {
    try {
      setState(() {
        _isLoading=true;
      });
      final result = await signInCase.signInWithPhoneNumber(phone);
      result.fold(
        (failure) {
          print('Failed signin: $failure');
        },
        (success) {
          print('Successful signin');
          Navigator.push(context, MaterialPageRoute(builder: (context) => EnterOTP(mobileNumber: phone)));
        },
      );
    } catch (e) {
      print('Error during sent otp: $e');
    }
    finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: ModalProgressHUD(
      inAsyncCall: _isLoading,
       child: Container(
         padding: const EdgeInsets.all(20),
         child: SingleChildScrollView(
           child: Column(
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
               const SizedBox(height: 10,),
                Text("Welcome",
                 style: HeadlineTS),
                Text("back!",
                 style: HeadlineTS),
               const SizedBox(height: 10,),
               const Text('Step in and Explore: Log In to',
                 style: TextStyle(
                   color: SecondryCol,
                   fontSize: 16.0,
                   fontFamily: 'Montserrat-ExtraBold',
                   fontWeight:FontWeight.w500,
                 ),),
               const SizedBox(height: 2,),
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
                 child:  Text('Enter your Phone Number',
                   style: TextStyle(
                     color: PrimaryCol,
                     fontSize: 16.0,
                     fontFamily: 'Montserrat-ExtraBold',
                     fontWeight:FontWeight.w700,
                   ),),
               ),
               const SizedBox(height: 8,),
               const Align(
                 alignment: Alignment.center,
                 child: Text('You will receive a 4 Digit verification code',
                   style: TextStyle(
                     color: SecondryCol,
                     fontSize: 15.0,
                     fontFamily: 'Montserrat-ExtraBold',
                     fontWeight:FontWeight.w500,
                   ),),
               ),
               const SizedBox(height: 20,),

               Form(
                key: _formKey,
                child: Column(
                  children :[
                     IntlPhoneField(
                     controller: numberController,
                     decoration: InputDecoration(
                     hintText: '84783894779',
                     border: OutlineInputBorder(
                         borderSide:const BorderSide(color:Colors.black87),
                         borderRadius: BorderRadius.circular(10.0)                 ),
                   ),
                   initialCountryCode: 'IN',
                   onChanged: (phone) {
                     setState(() {
                       phoneNumber = phone.completeNumber ?? '';
                     });
                   }
                             ), 
               const SizedBox(height: 10,),
               Column(
                children : [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked, // Set the initial value as needed
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked=value!;
                          });
                          // Handle checkbox state changes here
                        },
                      ),
              
                    Text("By countinuing,you agree to MargDrive",
                    style: TextStyle(
                     color:SecondryCol,
                     fontFamily: 'Montserrat-ExtraBold',
                     fontSize: 16.0,
                     fontWeight:FontWeight.w500,
                   ),),
                    ],
                  ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  
                   GestureDetector(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndCondition()));
                     },
                     child: const Text(
                       'Terms & Condition',
                       style: TextStyle(
                         color: PrimaryCol,
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                         decoration: TextDecoration.underline,
                       ),
                     ),
                   ),
                   const Text(' & ',
                   style: TextStyle(
                     fontSize: 16,
                   ),),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                     },
                     child: const Text('Privacy Poilcy',
                       style: TextStyle(
                         color: PrimaryCol,
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                         decoration: TextDecoration.underline,
                       ),
                     ),
                   )
                 ],
               ),
                ]
               ),
                  ],),
                ),
               const SizedBox(height:180,),
               Align(
                 alignment: Alignment.center,
                 child: ElevatedButton(
                     onPressed: () async{

                      if(_isChecked ){
                       String phoneNumber =numberController.text;
                       print('number:$phoneNumber');
       
                       await signin(phoneNumber);
       
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context)=> EnterOTP(
                               mobileNumber:phoneNumber ,
                           )));
                      }
                     },
                     style: ElevatedButton.styleFrom(
                         padding:const EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                         backgroundColor: PrimaryCol,
                         shape:RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         )
                     ),
                     child: const Text('Request OTP',
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
           ),
         ),
       ),
     ),
    );
  }
}
