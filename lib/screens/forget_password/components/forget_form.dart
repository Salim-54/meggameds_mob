import 'package:flutter/material.dart';
import 'package:meds_future/components/custom_suffix_icon.dart';
import 'package:meds_future/components/default_button.dart';
import 'package:meds_future/components/form_error.dart';
import 'package:meds_future/components/register_link.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/size_constants.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  List<String> errors = [sEmailNullError];
  bool _validEmail = true;
  String emailInput = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
                    _validEmail = true;
                  },
                );
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                setState(
                  () {
                    _validEmail = true;
                  },
                );
              } else if (emailValidatorRegExp.hasMatch(value)) {
                setState(
                  () {
                    _validEmail = false;
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
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaulButton(
              disabled: _validEmail,
              press: () {
                if (_formKey.currentState!.validate()) {
                  return;
                }
              },
              text: "Reset Password"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          RegisterLink(),
        ],
      ),
    );
  }
}
