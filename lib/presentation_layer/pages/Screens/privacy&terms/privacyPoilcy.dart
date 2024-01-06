import 'package:flutter/material.dart';
import 'package:geopilot_practice/core/const.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
              Text('Privacy Policy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29.0,
                  fontFamily: 'Montserrat-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              Text('Welcome to [Your App Name]! This Privacy Policy describes how [Your Company Name] ("Company," "we," or "us") collects, uses, and shares your personal information when you use the [Your App Name] mobile application (the "App"). By accessing or using the App, you agree to the terms of this Privacy Policy.',
                  style: termsstyle),
              SizedBox(height: 20,),
              Text('1. Information We Collect',
                style:termsstyle,),
              Text("a. User Account Information:",
                  style:termsstyle),
              Text('* When you create an account on the App, we may collect your name, email address, phone number, and other contact details.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('b. Driver Information:',
                style: termsstyle,),
              Text('If you choose to become a driver on the App, we may collect additional information, including your driver\'s license details, vehicle information, and other necessary details for background checks.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('c. Transaction Information:',
                style: termsstyle,),
              Text('We collect information related to transactions on the App, such as payment details, transaction history, and related data.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('d. Location Information:',
                style: termsstyle,),
              Text('To provide our services, we may collect and process your location data when the App is actively running on your device.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('e. Device Information:',
                style: termsstyle,),
              Text('We collect information about the device you use to access the App, including device type, operating system, and unique device identifiers.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('f. Log Data:',
                style: termsstyle,),
              Text('Our servers automatically log information when you use the App, including IP addresses, access times, and app usage information.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('2. How We Use Your Information:',
                style: termsstyle,),
              Text('We use your information to provide and improve our services, connect drivers with users, process transactions, and ensure the functionality of the App.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('b. Communication:',
                style: termsstyle,),
              Text('We may use your contact information to communicate with you regarding your account, transactions, and important updates about the App.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('c. Security and Fraud Prevention:',
                style: termsstyle,),
              Text('We use your information to monitor and prevent fraudulent activities, unauthorized access, and other security issues.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('d. Legal Compliance:',
                style: termsstyle,),
              Text('We may use your information to comply with applicable laws, regulations, and legal processes.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('3. Information Sharing:',
                style: termsstyle,),
              Text('a. Third-Party Service Providers:',
                style: termsstyle,),
              Text('We may share your information with third-party service providers who assist us in providing and improving our services, including payment processing, background checks, and customer support.',
                style: termsstyle,),
              SizedBox(height: 20,),

              Text('b. Legal Requirements:',
                style: termsstyle,),
              Text('4. Your Choices:',
                style: termsstyle,),
              Text('a. Account Information:',
                style: termsstyle,),
              Text('You can review and update your account information by logging into the App.',
                style: termsstyle,),
              SizedBox(height: 20,),
              Text('b. Location Information:',
                style: termsstyle,),
              Text('You can control the App\'s access to your device\'s location settings through your device settings.',
                style: termsstyle,),

              Text('You can control the App\'s access to your device\'s location settings through your device settings.',
                style: termsstyle,),
              SizedBox(height: 20,),

              Text('5. Security:',
                style: termsstyle,),
              Text('We take reasonable measures to protect your information from unauthorized access, disclosure, alteration, and destruction.',
                style: termsstyle,),
              SizedBox(height: 20,),

              Text('6. Changes to Privacy Policy:',
                style: termsstyle,),
              Text('We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
                style: termsstyle,),
              SizedBox(height: 20,),

              Text('7. Contact Us:',
                style: termsstyle,),
              Text('If you have any questions or concerns about this Privacy Policy, please contact us at [Your Contact Information].',
                style: termsstyle,),
              SizedBox(height: 20,),

              Text('Thank you for using [Your App Name]!',
                style: termsstyle,),














            ],
          ),
        ),
      ),
    );
  }
}
