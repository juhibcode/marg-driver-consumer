import 'package:dartz/dartz.dart';
import 'package:geopilot_practice/core/failures_successes.dart';

// abstract class SignInRepository {
//   Future<Either<Failure, bool>> signInWithPhoneNumber(String phoneNumber);
// }
// abstract class SignUpRepository {
//   Future<Either<Failure,bool>> signUpWithnameandnumber(String name,String phoneNumber);
// }

abstract class SignInRepository {
  Future<Either<Failure, Map<String, dynamic>>> signInWithPhoneNumber(String phoneNumber);
  Future<Either<Failure, Map<String, dynamic>>> verifySignInOtp(String phoneNumber, String otp);

}
abstract class SignUpRepository {
  Future<Either<Failure, Map<String, dynamic>>> signUpWithnameandnumber(String name,String phoneNumber);
    Future<Either<Failure, Map<String, dynamic>>> verifySignUpOtp(String name,String phoneNumber,String otp);

}





















// import '../entities/user_info.dart';
// import 'package:geopilot_practice/domain_layer/usecases/signin.dart';
// import 'package:dartz/dartz.dart';
// import 'package:geopilot_practice/core/failures_successes.dart';

// abstract class SignInRepository{
//   Future<Either<Failure,bool>> signin(UserSignIn signin);
// }
// abstract class UserRepository {

//   Future<List<User>> SignIn(String phone,String name);
//   Future<List<User>> SignUp(String name,String phone);
//   Future<List<User>> VerifySignIn(String phone,String otp);
//   Future<List<User>> VerifySignUp(String name,String phone,String otp);
// }

// abstract class FetchRepo{

// Future<Either<Failure,List<User>>> userSignIn();
// }

// domain/repositories/signin_repository.dart


// abstract class SignInRepository {
//   Future<void> signInWithPhoneNumber(String phone);
// }
