import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidationRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String ERROR_EMAIL_NULL = "Please enter your email address";
const String ERROR_INVALID_EMAIL = "Please enter valid email address";
const String ERROR_PASSWORD_NULL = "Please enter your password";
const String ERROR_SHORT_PASSWORD = "Password is too short";
const String ERROR_PASSWORD_MISMATCH = "Password don't match";
