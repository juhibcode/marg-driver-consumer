import 'package:flutter/material.dart';
import 'package:geopilot_practice/core/const.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/enterOTP.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/sigIn.dart';
import 'package:geopilot_practice/presentation_layer/pages/Screens/privacy&terms/Terms&Condition.dart';
import 'package:geopilot_practice/domain_layer/usecases/signin.dart';
import 'package:geopilot_practice/data_layer/repositories/auth_repository.dart';
import 'package:geopilot_practice/data_layer/datasource/datasource.dart';
import 'package:geopilot_practice/domain_layer/repositories_impl/fetch_repo_contract.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:geopilot_practice/logic/validator.dart';



class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpRepository signUpRepository;
late final SignUpcase signUpCase;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _city = '';
  bool _isChecked = false;
  bool _isLoading = false;

  String name='';
  String phoneNumber='';
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SignUpRemoteDataSource remoteDataSource = SignUpRemoteDataSource('https://marg-drive-dev-server.onrender.com');
    signUpRepository = SignUpRepositoryImpl(remoteDataSource); 
    signUpCase = SignUpcase(signUpRepository);
  }

  Future<void> signup(String name, String phone) async {
    try {
      setState(() {
       _isLoading=true;
      });
      
      final result = await signUpCase.signUpWithnameandnumber(name,phone);
      result.fold(
        (failure) {
          print('Failed signin: $failure');
        },
        (success) {
          print('Successful signin');
          Navigator.push(context,
           MaterialPageRoute(
            builder: (context) => EnterOTP(Nameid:name,mobileNumber: phone)));
        },
      );
    } catch (e) {
      print('Error during sign-in: $e');
    }
    finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ModalProgressHUD(
        inAsyncCall: _isLoading,
        color: PrimaryCol,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SkipButton
                      ],),
                // const SizedBox(height: 15,),
               Text("Let's get",
                  style:HeadlineTS),
                 Text("started.",
                    style: HeadlineTS),
                 const SizedBox(height: 10,),
                 const Text('Please enter your details.',
                    style: TextStyle(
                      color: SecondryCol,
                      fontSize: 16.0,
                      height: 1.23,
                      fontFamily: 'Montserrat-Bold',
                      fontWeight:FontWeight.w500,
                    ),),
                const SizedBox(height: 40,),
                 Form(
                  key:_formKey,
                   child: Column(
                     children: [
                       const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Full Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat-Bold',
                                color: SecondryCol,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                               
                                 const SizedBox(height: 5),
                                 TextFormField(
                                  validator: Validator.validateFullname(),

                                  onSaved: (value){
                                    _name=value!;
                                  },
                                  
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Sharique Siddiqui',
                   
                      hintStyle: const TextStyle(
                        color: Hiddentextcol,
                        height: 2,
                   
                      ),
                       border: OutlineInputBorder(
                         borderSide:const BorderSide(color:Colors.black87),
                         borderRadius: BorderRadius.circular(10.0)                 ),
                      prefixIcon: Image.asset('assets/icons/user.png'),
                                 ),
                      onChanged: (name) {
                        setState(() {
                          name = name ;
                        });
                      }
                                 ),
                                 const SizedBox(height: 25.00,),
                                 const Row(
                    children: [
                       Text('Mobile Number',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat-Bold',
                          color: SecondryCol,
                          fontSize: 16.0,
                        ),) ,
                       Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                                 ),
                                 const SizedBox(height:5),
                                 IntlPhoneField(
                                                     controller: numberController,
                                                     decoration: InputDecoration(
                                                       hintText: '84783894779',
                                                       hintStyle: const TextStyle(
                                                         color: Hiddentextcol,
                                                         height: 2,
                                                       ),
                                                       //   border: OutlineInputBorder(
                                                     //       borderSide:const BorderSide(color:hiddentext),
                                                     //       borderRadius: BorderRadius.circular(10.0),              ),
                                                     // ),
                                                      border: OutlineInputBorder(
                                                       borderSide:const BorderSide(color:Colors.black87),
                                                      borderRadius: BorderRadius.circular(10.0)                 ),
                                                    
                                 ),
                                 initialCountryCode: 'IN',
                                                       onChanged: (phone) {
                                                         setState(() {
                                                           phoneNumber = phone.completeNumber ?? '';
                                                         });
                                                       },
                                                      //  validator:phonevalidator(),
                                 ),
                                 const SizedBox(height: 8.00,),
                                 const Row(
                    children: [
                       Text(
                        'City you are drive in',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat-Bold',
                          color: SecondryCol,
                          fontSize: 16.0,
                        ),
                      ),
                       Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                                 ),
                                 const SizedBox(height: 5,),
                    TextFormField(
                       validator: Validator.validateCity(),

                      onSaved: (value){
                        _city=value!;
                      } ,
                    decoration: InputDecoration(
                      hintText:'Nagpur',
                      hintStyle: const TextStyle(
                          color: Hiddentextcol,
                          height: 0,
                      ),
                       border: OutlineInputBorder(
                         borderSide:const BorderSide(color:Colors.black87),
                         borderRadius: BorderRadius.circular(10.0)                 ),
                      prefixIcon:Image.asset('assets/icons/marker.png'),
                      // Image.asset('assets/icons/marker.png'),
                    ),
                                 ),
                                 const SizedBox(height: 15,),
                                 Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      const Text(
                        'l Agree to ',
                        style: TextStyle(color: Colors.black
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndCondition()));
                        },
                        child: const Text(
                          'Terms & Conditions.',
                          style: TextStyle(
                            color: PrimaryCol,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                                 ),
                                 ],
                   ),
                 ),
                const SizedBox(height: 25,),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () async {
                         if (_formKey.currentState!.validate() && _isChecked) {
                      _formKey.currentState!.save();
        
                      String name = nameController.text;
                        String number = numberController.text;
                        print('name: $name, number: $number');
                        await signup(name, number);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> EnterOTP(
                              mobileNumber:phoneNumber ,
                              Nameid:name
                            )));
                            }
                      },
                      style: ElevatedButton.styleFrom(
                          padding:EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
                          backgroundColor: PrimaryCol,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      ),
                      child: const Text('Sign Up',
                          style: TextStyle(fontSize: 21.0,
                          color: Colors.white))),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>SigIn_Screen() ));
                      // Perform actions with name and password
                      },
                      child: const Text(
                        'Login',
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
      )
    );
  }
}
// "name": "Tanmay Jangde",
// "phone": "+917385690230"