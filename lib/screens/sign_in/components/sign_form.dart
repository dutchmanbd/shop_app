import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/custom_svg_icon.dart';
import '../../../components/form_error.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text('Remember Me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(ERROR_PASSWORD_NULL)) {
          setState(() {
            errors.remove(ERROR_PASSWORD_NULL);
          });
        } else if (value.length >= 4 && errors.contains(ERROR_SHORT_PASSWORD)) {
          setState(() {
            errors.remove(ERROR_SHORT_PASSWORD);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(ERROR_PASSWORD_NULL)) {
          setState(() {
            errors.add(ERROR_PASSWORD_NULL);
          });
          return "";
        } else if (value.length < 4 && !errors.contains(ERROR_SHORT_PASSWORD)) {
          setState(() {
            errors.add(ERROR_SHORT_PASSWORD);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(ERROR_EMAIL_NULL)) {
          setState(() {
            errors.remove(ERROR_EMAIL_NULL);
          });
        } else if (emailValidationRegExp.hasMatch(value) &&
            errors.contains(ERROR_INVALID_EMAIL)) {
          setState(() {
            errors.remove(ERROR_INVALID_EMAIL);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(ERROR_EMAIL_NULL)) {
          setState(() {
            errors.add(ERROR_EMAIL_NULL);
          });
          return "";
        } else if (!emailValidationRegExp.hasMatch(value) &&
            !errors.contains(ERROR_INVALID_EMAIL)) {
          setState(() {
            errors.add(ERROR_INVALID_EMAIL);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
