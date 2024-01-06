import 'package:flutter/material.dart';
import 'package:geopilot_practice/logic/base_validator.dart';
class Validator {
  static FormFieldValidator<String> validateEquality(
      String string, String errorMsg) {
    return (value) {
      if (value == string) {
        return null;
      } else {
        return errorMsg;
      }
    };
  }

  static FormFieldValidator<String> validateNonull(String inputName) {
    return BaseValidator.validateRegex(r".+", "$inputName should not be empty");
  }

  static FormFieldValidator<String> validateFullname() {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Name should not be empty"),
    ]);
  }

  static FormFieldValidator<String> validatePhone() {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Phone should not be empty"),
      BaseValidator.validateRegex(
          r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$",
          "Phone number is not valid")
    ]) ;
  }
  static FormFieldValidator<String> validateCity(){
    return BaseValidator.validate([
        BaseValidator.validateRegex(r".+", "Name should not be empty"),

    ]);
  }
  
  static FormFieldValidator<String> validateOTP(bool isLogin) {
    if (isLogin) {
      return BaseValidator.validateRegex(
        r"\d{4}",
        "OTP should not be empty",
      );
    }
    return BaseValidator.validate([
      BaseValidator.validateRegex(
        r"\d{4}",
        "OTP should not be empty",
      ),
       BaseValidator.validateRegex(
       r".{6}", "Password should contain 4 number"),
    ]);

  }

  // static FormFieldValidator<String> validatePassword(bool isLogin) {
  //   if (isLogin) {
  //     return BaseValidator.validateRegex(r".+", "Password should not be empty");
  // }
  //   return BaseValidator.validate([
  //     BaseValidator.validateRegex(r".+", "Password should not be empty"),
  //     BaseValidator.validateRegex(
  //         r".{6}", "Password should be minimum 6 characters"),
  //     // BaseValidator.validateRegex(r"^.{6,12}$", "Password should be maximum 12 characters"),
  //     // BaseValidator.validateRegex(r"[A-Z]+", "Password should contain an uppercase character"),
  //     // BaseValidator.validateRegex(r"[a-z]+", "Password should contain a lowercase character"),
  //     // BaseValidator.validateRegex(r"[0-9]+", "Password should contain a digit"),
  //     // BaseValidator.validateRegex(r"[\.!$%&\'*+/=?^_`{|}~\-:;@]+", "Password should contain minimum one of !\$%&\'*+/=?^_`{|}~\-:;@"),
  //     BaseValidator.validateInvertRegex(
  //         r"[#]+", "Password should not contain #"),
  //   ]);
  // }

  // static FormFieldValidator<String> validateConfirmPassword(String password) {
  //   return BaseValidator.validate([
  //     BaseValidator.validateRegex(
  //         r".+", "Confirm password should not be empty"),
  //     validateEquality(password, "Confirm password doesn't mactch")
  //   ]);
  // }

  // static FormFieldValidator<String> validateUsername() {
  //   return BaseValidator.validate([
  //     BaseValidator.validateRegex(r".+", "Username should not be empty"),
  //   ]);
  // }

}
