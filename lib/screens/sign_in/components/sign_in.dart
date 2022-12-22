import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meds_future/components/custom_suffix_icon.dart';
import 'package:meds_future/components/default_button.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/screens/forget_password/forget_screen.dart';
import 'package:meds_future/screens/home/home.screen.dart';
import 'package:meds_future/size_constants.dart';

import '../../../components/form_error.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _disabled = true;
  bool _validEmail = false;
  bool _validPassword = false;
  bool _check = false;
  final List errors = [];
  String emailInput = "";
  String passwordInput = "";

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("email: " + emailInput);
      print("password: " + passwordInput);
      Get.to(Home());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextField(),
          SizedBox(
            height: getProportionateScreenHeight(28),
          ),
          buildPasswordTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Row(
            children: [
              Checkbox(
                value: _check,
                onChanged: (value) {
                  setState(() {
                    _check = value!;
                  });
                },
                checkColor: Colors.white,
                activeColor: sPrimaryColor,
              ),
              Text("Remember me!"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                    color: sPrimaryColor,
                  ),
                ),
              )
            ],
          ),
          DefaulButton(
            disabled: _validPassword && _validEmail ? !_disabled : _disabled,
            press: _onSubmit,
            text: "Login",
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      onSaved: (newValue) => passwordInput = newValue!,
      onChanged: ((value) {
        if (value.isEmpty) {
          setState(
            () {
              _validPassword = false;
            },
          );
        } else if (value.isNotEmpty && errors.contains(sPassNullError)) {
          setState(
            () {
              errors.remove(sPassNullError);
            },
          );
        } else if (value.length <= 6) {
          setState(
            () {
              _validPassword = false;
            },
          );
        } else if (value.length >= 6) {
          setState(
            () {
              _validPassword = true;
            },
          );
        } else if (value.length >= 6 && errors.contains(sShortPassError)) {
          errors.remove(sShortPassError);
        }

        return null;
      }),
      validator: ((value) {
        if (value!.isEmpty && !errors.contains(sPassNullError)) {
          setState(
            () {
              errors.add(sPassNullError);
              _validPassword = false;
            },
          );
        } else if (value.length < 6 && !errors.contains(sShortPassError)) {
          errors.add(sShortPassError);
          _validPassword = false;
        }
        return null;
      }),
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password . . .",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconColor: sPrimaryColor,
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      onSaved: (newValue) => emailInput = newValue!,
      onChanged: ((value) {
        if (value.isNotEmpty && errors.contains(sEmailNullError)) {
          setState(
            () {
              errors.remove(sEmailNullError);
            },
          );
        } else if (value.isEmpty) {
          setState(
            () {
              _validEmail = false;
            },
          );
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          setState(
            () {
              _validEmail = false;
            },
          );
        } else if (emailValidatorRegExp.hasMatch(value)) {
          setState(
            () {
              _validEmail = true;
            },
          );
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(sInvalidEmailError)) {
          errors.remove(sInvalidEmailError);
        }

        return null;
      }),
      validator: ((value) {
        if (value!.isEmpty && !errors.contains(sEmailNullError)) {
          setState(
            () {
              errors.add(sEmailNullError);
            },
          );
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(sInvalidEmailError)) {
          errors.add(sInvalidEmailError);
        }
        return null;
      }),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email . . .",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconColor: sPrimaryColor,
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
