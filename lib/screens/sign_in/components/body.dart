import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import '../components/custom_svg_icon.dart';
import '../components/form_error.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign in with email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SignForm()
            ],
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
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
        } else if (value.length < 4 && !errors.contains(ERROR_SHORT_PASSWORD)) {
          setState(() {
            errors.add(ERROR_SHORT_PASSWORD);
          });
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
        } else if (!emailValidationRegExp.hasMatch(value) &&
            !errors.contains(ERROR_INVALID_EMAIL)) {
          setState(() {
            errors.add(ERROR_INVALID_EMAIL);
          });
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
