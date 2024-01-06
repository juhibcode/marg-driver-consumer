import 'package:dartz/dartz.dart';
import 'package:geopilot_practice/core/failures_successes.dart';
import 'package:geopilot_practice/domain_layer/repositories_impl/fetch_repo_contract.dart';

//  class SignIncase{

//  final SignInRepository signInRepository;
//  SignIncase(this.signInRepository);

//   Future<Either<Failure,bool>> signInWithPhoneNumber(String phoneNumber){
//     return signInRepository.signInWithPhoneNumber(phoneNumber);
//   }
// }
//  class SignUpcase{

//  final SignUpRepository signUpRepository;
//  SignUpcase(this.signUpRepository);

//   Future<Either<Failure,bool>> signUpWithnameandnumber(String name,String phoneNumber){
//     return signUpRepository.signUpWithnameandnumber(name,phoneNumber);
//   }
// }

class SignIncase {
  final SignInRepository signInRepository;
  SignIncase(this.signInRepository);

  Future<Either<Failure, Map<String, dynamic>>>signInWithPhoneNumber(String phoneNumber) {
    return signInRepository.signInWithPhoneNumber(phoneNumber);
  }

  Future<Either<Failure, Map<String, dynamic>>> verifySignInOtp(String phoneNumber, String otp) {
    return signInRepository.verifySignInOtp( phoneNumber,  otp);
  }
}

class SignUpcase {
  final SignUpRepository signUpRepository;
  SignUpcase(this.signUpRepository);

  Future<Either<Failure, Map<String, dynamic>>>signUpWithnameandnumber(String name, String phoneNumber) {
    return signUpRepository.signUpWithnameandnumber(name, phoneNumber);
  }

  Future<Either<Failure, Map<String, dynamic>>> verifySignUpOtp(String name,String phoneNumber,String otp) {
    return signUpRepository.verifySignUpOtp( name,phoneNumber,otp);
  }
}

