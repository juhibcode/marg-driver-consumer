import 'package:dartz/dartz.dart';
import 'package:geopilot_practice/core/failures_successes.dart';
import 'package:geopilot_practice/data_layer/datasource/datasource.dart';
import 'package:geopilot_practice/domain_layer/repositories_impl/fetch_repo_contract.dart';


class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource remoteDataSource;

  SignInRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<Either<Failure, Map<String, dynamic>>> signInWithPhoneNumber(String phoneNumber) async {
    try {
      final success = await remoteDataSource.signInWithPhoneNumber(phoneNumber);
      return Right(success);
    } catch (e) {
      return Left(Failure('Error during sign-in $e'));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> verifySignInOtp(String phoneNumber,String otp) async {
    try {
      final success = await remoteDataSource.verifySignInOtp(phoneNumber,otp);
      return Right(success);
    } catch (e) {
      return Left(Failure('Error during sign-in OTP verification $e'));
    }
  }
}

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<Either<Failure, Map<String, dynamic>>> signUpWithnameandnumber(String name,String phoneNumber) async {
    try {
      final success = await remoteDataSource.signUpWithnameandnumber(name,phoneNumber);
      return Right(success);
    } catch (e) {
      return Left(Failure('Error during sign-up $e'));
    }
  }
  Future<Either<Failure, Map<String, dynamic>>> verifySignUpOtp(String name, phoneNumber,String otp) async {
    try {
      final success = await remoteDataSource.verifySignUpOtp(name,phoneNumber,otp);
      return Right(success);
    } catch (e) {
      return Left(Failure('Error during sign-up OTP verification $e'));
    }
  }
}


//just remove 2 overide......























// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:dartz/dartz.dart';
// // import 'package:geopilot_practice/domain_layer/entities/user_info.dart';
// // import 'package:geopilot_practice/domain_layer/repositories_impl/fetch_repo_contract.dart';

// // class AuthRepositoryImpl implements AuthRepository {
// //   final String baseUrl = 'http://localhost:5000/api/v1/userAuth/signup';

// //   @override
// //   Future<Either<String, User>> signIn(String phoneNumber) async {
// //     try {
// //       final response = await http.post(
// //         Uri.parse('$baseUrl/signin'),
// //         body: {
// //           'phone':phoneNumber,
// //         },
// //       );

// //       if (response.statusCode == 200) {
// //         final user = User.fromJson(jsonDecode(response.body));
// //         return Right(user);
// //       } else {
// //         return Left('Failed to sign in. ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       return Left('Error during sign in. $e');
// //     }
// //   }

// //   // @override
// //   // Future<Either<String, User>> signUp(String phoneNumber) async {
// //   //   try {
// //   //     final response = await http.post(
// //   //       Uri.parse('$baseUrl/signup'),
// //   //       body: {
// //   //         'phoneNumber': phoneNumber,
// //   //       },
// //   //     );

// //   //     if (response.statusCode == 200) {
// //   //       final user = User.fromJson(jsonDecode(response.body));
// //   //       return Right(user);
// //   //     } else {
// //   //       return Left('Failed to sign up. ${response.statusCode}');
// //   //     }
// //   //   } catch (e) {
// //   //     return Left('Error during sign up. $e');
// //   //   }
// //   // }

// //   // @override
// //   // Future<Either<String, bool>> verifyOTPup(String phoneNumber, String otp) async {
// //   //   try {
// //   //     final response = await http.post(
// //   //       Uri.parse('$baseUrl/verify-otp'),
// //   //       body: {
// //   //         'phoneNumber': phoneNumber,
// //   //         'otp': otp,
// //   //       },
// //   //     );

// //   //     if (response.statusCode == 200) {
// //   //       final success = jsonDecode(response.body)['success'] as bool;
// //   //       return Right(success);
// //   //     } else {
// //   //       return Left('Failed to verify OTP. ${response.statusCode}');
// //   //     }
// //   //   } catch (e) {
// //   //     return Left('Error during OTP verification. $e');
// //   //   }
// //   // }

// //   // @override
// //   // Future<Either<String, bool>> verifyOTPin(String name,String phoneNumber, String otp) async {
// //   //   try {
// //   //     final response = await http.post(
// //   //       Uri.parse('$baseUrl/verify-otp'),
// //   //       body: {
// //   //         'name': name,
// //   //         'phoneNumber': phoneNumber,
// //   //         'otp': otp,
// //   //       },
// //   //     );

// //   //     if (response.statusCode == 200) {
// //   //       final success = jsonDecode(response.body)['success'] as bool;
// //   //       return Right(success);
// //   //     } else {
// //   //       return Left('Failed to verify OTP. ${response.statusCode}');
// //   //     }
// //   //   } catch (e) {
// //   //     return Left('Error during OTP verification. $e');
// //   //   }
// //   // }
// // }

// // data/repositories/signin_repository_impl.dart

// import 'package:geopilot_practice/data/datasources/signin_remote_data_source.dart';
// import 'package:geopilot_practice/domain/entities/user_entity.dart';
// import 'package:geopilot_practice/domain/repositories/signin_repository.dart';

// class SignInRepositoryImpl implements SignInRepository {
//   final SignInRemoteDataSource remoteDataSource;

//   SignInRepositoryImpl(this.remoteDataSource);

//   @override
//   Future<void> signInWithPhoneNumber(UserEntity user) async {
//     await remoteDataSource.signInWithPhoneNumber(UserModel(phoneNumber: user.phoneNumber));
//   }
// }
