import 'package:MMEDES/size_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

import '../../../providers/authentication.dart';
import '../../../utils/http_exceptions.dart';
import '../../../utils/snack_bar.dart';
import '../../home/home.screen.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  Future<void> signUserUp() async {
    // show loading circle

    // await Future.delayed(Duration(seconds: 3));
    // Navigator.of(context).pop();
    // await Future.delayed(Duration(seconds: 1));
    // Get.to(Home());
    // validations!!!!

    if (passwordController.text == confirmPasswordController.text &&
        GetUtils.isPhoneNumber(phoneController.text) &&
        phoneController.text[0] == "0" &&
        phoneController.text.length == 10 &&
        GetUtils.isEmail(emailController.text) &&
        passwordController.text.length >= 4 &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        GetUtils.isPhoneNumber(phoneController.text)) {
      var data = {
        "email": emailController.text,
        "password": passwordController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "phone": "25" + phoneController.text
      };
      try {
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        // await Provider.of<AuthProvider>(
        //   context,
        //   listen: false,
        // ).register(
        //   firstNameController.text,
        //   lastNameController.text,
        //   emailController.text,
        //   phoneController.text,
        //   passwordController.text,
        // );
        // print("Registered");

        // Dio dio = Dio();

        // // Create the request options
        // Options options = Options(
        //   headers: {"Content-Type": "application/json"},
        // );
        // var response = await Dio().get('http://3.91.178.169/api/v1/medicines');
        // print(response.data['data']['medicines'][0]);

        // Create the request body
        Map<String, dynamic> body = {
          "email": emailController.text,
          "password": passwordController.text,
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "phone": "25" + phoneController.text,
        };
        var response = await Dio().post(
          'http://3.91.178.169/auth/signup',
          data: {
            "email": emailController.text,
            "password": passwordController.text,
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
            "phone": "25" + phoneController.text,
          },
        );
        // ignore: unnecessary_null_comparison

        print(response);

        // // Make a POST request to a URL
        // final response = await dio.post("http://3.91.178.169/auth/signup",
        //     data: body, options: options);

        // // Print the response body
        // print(response.data + '+++++++++++++++++++++++++++++++');
        // print('Registered');

        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => Home(),
        //   ),
        //   ModalRoute.withName("/home"),
        // // );
        Navigator.pop(context);
      } on DioError catch (e) {
        Navigator.pop(context);
        print(e.response!.statusCode);

        print(e.response?.data['message']);
        if (e.response!.statusCode == 400) {
          showSnackbar(context, e.response?.data['message'], type: "failed");
        }
        // Check the type of the error
        // if (e.type == DioErrorType.response) {
        //   // A 400 error occurred
        //   if (e.response!.statusCode == 400) {
        //     // Handle the error here
        //   }
        // }
      } on CustomHttpException catch (e) {
        showSnackbar(context, e.message, type: "failed");
        Navigator.pop(context);
      } catch (e) {}
      // print(data);
    } else if (GetUtils.isPhoneNumber(phoneController.text) == false ||
        phoneController.text.length != 10 ||
        phoneController.text[0] != "0") {
      showSnackbar(context, "your phone is not valid!", type: "failed");
    } else if (GetUtils.isEmail(emailController.text) == false) {
      showSnackbar(context, "your email is not valid!", type: "failed");
    } else if (firstNameController.text.isEmpty) {
      showSnackbar(context, "FIrst name should not be empty", type: "failed");
    } else if (lastNameController.text.isEmpty) {
      showSnackbar(context, "Last name should not be empty!", type: "failed");
    } else if (passwordController.text.length < 4) {
      showSnackbar(context, "Password is too short!", type: "failed");
    } else if (passwordController.text != confirmPasswordController.text)
      showSnackbar(context, "your passwords don't match", type: "failed");

    // try creating the user
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                const Icon(
                  Icons.lock,
                  size: 50,
                  color: sPrimaryColor,
                ),

                const SizedBox(height: 25),

                // let's create an account for you
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                // first name
                MyTextField(
                  controller: firstNameController,
                  hintText: 'First name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // last name

                MyTextField(
                  controller: lastNameController,
                  hintText: 'Last name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                PhoneTextInput(
                  controller: phoneController,
                  hintText: 'Phone',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 50),
                SizedBox(height: getProportionateScreenHeight(40)),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginPage());
                      },
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
