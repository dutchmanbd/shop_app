import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

// Form Error
final RegExp emailValidationRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String ERROR_EMAIL_NULL = "Please enter your email address";
const String ERROR_INVALID_EMAIL = "Please enter valid email address";
const String ERROR_PASSWORD_NULL = "Please enter your password";
const String ERROR_SHORT_PASSWORD = "Password is too short";
const String ERROR_PASSWORD_MISMATCH = "Password don't match";
const String ERROR_FIRST_NAME_NULL = "Please enter your first name";
const String ERROR_LAST_NAME_NULL = "Please enter your last name";
const String ERROR_PHONE_NUMBER_NULL = "Please enter your phone number";
const String ERROR_ADDRESS_NULL = "Please enter your address";
