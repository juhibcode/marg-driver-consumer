class UserSigninEntity{
  final String phoneNumber;
  final String? name;
  // final String otp;
  UserSigninEntity({this.name,required this.phoneNumber});
}

class VerifySignInOtpEntity {
  final String phone;
  final String otp;
  VerifySignInOtpEntity({
  required this.phone,
  required this.otp});
}

class VerifySignUpOtpEntity {
    final String name;
  final String phone;
  final String otp;
  VerifySignUpOtpEntity({
    required this.name,
  required this.phone,
  required this.otp});
}