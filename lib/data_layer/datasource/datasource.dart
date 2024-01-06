
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl_phone_field/phone_number.dart';

// class SignInRemoteDataSource {
//   String baseUrl='https://marg-drive-dev-server.onrender.com'; 

//   SignInRemoteDataSource(this.baseUrl);

//   Future<bool> signInWithPhoneNumber(String phoneNumber) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/v1/userAuth/signin'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'phone': "+91$phoneNumber",
//         }),
//       );

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         throw Exception('Failed to sign in');
//       }
//     } catch (e) {
//       throw Exception('Error during sign-in: $e');
//     }
//   }

// }


// class SignUpRemoteDataSource {
//   String baseUrl='https://marg-drive-dev-server.onrender.com'; 

//   SignUpRemoteDataSource(this.baseUrl);

//   Future<bool> signUpWithnameandnumber(String name,String phoneNumber) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/v1/userAuth/signup'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'name': name,
//           'phone':"+91$phoneNumber",
//         }),
//       );

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         throw Exception('Failed to sign in');
//       }
//     } catch (e) {
//       throw Exception('Error during sign-in: $e');
//     }
//   }
// }

class SignInRemoteDataSource {
  String baseUrl='https://marg-drive-dev-server.onrender.com'; 

  SignInRemoteDataSource(this.baseUrl);

  Future<Map<String, dynamic>> signInWithPhoneNumber(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/userAuth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': "+91$phoneNumber",
        }),
      );

      if (response.statusCode == 200) {
       final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;     
         } else {
        throw Exception('Failed to sent otp');
      }
    } catch (e) {
      throw Exception('Error during sign-in: $e');
    }
  }

   Future<Map<String, dynamic>> verifySignInOtp(String phoneNumber,String otp) async {
  try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/userAuth/verifySigninOtp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone':"+91$phoneNumber",
          'otp': otp,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to signin');
      }
    } catch (e) {
      throw Exception('Error during sign-in: $e');
    }
  }

}


class SignUpRemoteDataSource {
  String baseUrl='https://marg-drive-dev-server.onrender.com'; 

  SignUpRemoteDataSource(this.baseUrl);

  Future<Map<String, dynamic>> signUpWithnameandnumber(String name,String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/userAuth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'phone':"+91$phoneNumber",
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      throw Exception('Error during sign-in: $e');
    }
  }

  Future<Map<String, dynamic>> verifySignUpOtp(String name,String phoneNumber,String otp) async {
  try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/userAuth/verifySignupOtp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
           'name':name,
          'phone':"+91$phoneNumber",
          'otp': otp,
        }),
      );
    print('Verify SignUp Response: ${response.statusCode} ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
          print('Error during sign-up OTP verification: $e');

      throw Exception('Error during sign-up: $e');
  
    }
  }
}





 