import 'package:flutter/material.dart';
import 'package:geopilot_practice/core/const.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/Arrow 1.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Privacy & Terms',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Montserrat-Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terms & Conditions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29.0,
                  fontFamily: 'Montserrat-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              Text('Welcome to [Your App Name]! These terms and conditions ("Terms") govern your use of the [Your App Name] mobile application (the "App") and the services provided by [Your Company Name] ("Company," "we," or "us"). By accessing or using the App, you agree to be bound by these Terms.',
              style: termsstyle),
              SizedBox(height: 20,),
              Text('1. Acceptance of Terms:By using the App, you agree to comply with and be legally bound by these Terms. If you do not agree to these Terms, please do not use the App.',
                style:termsstyle,),
              SizedBox(height: 20,),
              Text("2. Eligibility:To use the App, you must be at least 21 years old and possess a valid driver's license. By using the App, you represent and warrant that you meet these eligibility requirements.",
                style:termsstyle),
              SizedBox(height: 20,),
              Text('3. Driver Verification:Before being approved as a driver on the App, you must undergo a thorough background check, provide valid identification, and meet the Company\'s eligibility criteria. The Company reserves the right to deny or revoke driver status based on the results of the background check.',
              style: termsstyle,),
              SizedBox(height: 20,),
              Text('4. Use of the App:You agree to use the App only for its intended purpose, which is to connect drivers with potential employers or users seeking transportation services. You will not use the App for any illegal or unauthorized purpose.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('5. User Conduct:You agree to treat all users with respect and courtesy. Discrimination, harassment, or any form of abusive behavior will not be tolerated. The Company reserves the right to suspend or terminate your account if you engage in inappropriate conduct.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('6. Payment:Drivers will be compensated according to the rates set by the Company. Payments will be processed through the App, and drivers are responsible for providing accurate payment information. The Company may deduct fees, commissions, or other charges as specified in the payment terms.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('7. Ratings and Reviews:Users and drivers may provide ratings and reviews after completing a transaction. The Company reserves the right to display these ratings and reviews on the App. Any false or misleading information may result in account suspension or termination.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('8. Privacy:The Company values your privacy and will handle your personal information in accordance with its Privacy Policy. By using the App, you consent to the collection and use of your information as described in the Privacy Policy.',
              style: termsstyle,),
              SizedBox(height: 20,),
              Text('9. Termination:The Company reserves the right to suspend or terminate your account at any time for violation of these Terms, illegal activities, or for any other reason at the Company\'s discretion.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('10. Changes to Terms:The Company reserves the right to update or modify these Terms at any time. It is your responsibility to review these Terms periodically for changes. Continued use of the App after any changes indicates your acceptance of the modified Terms.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('11. Governing Law:These Terms are governed by and construed in accordance with the laws of [Your Jurisdiction]. Any disputes arising under or in connection with these Terms shall be resolved in the courts of [Your Jurisdiction].',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('Thank you for using [Your App Name]! If you have any questions or concerns, please contact us at [Your Contact Information].',
                style: termsstyle,),






            ],
          ),
        ),
      ),
    );
  }
}
