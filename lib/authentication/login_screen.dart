import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_starter/authentication/sign_up_screen.dart';
import 'package:jwt_starter/model/auth_model.dart';
import 'package:jwt_starter/view%20model/register_viewmodel.dart';
import 'package:jwt_starter/widgets/custom_elevated_button.dart';
import 'package:jwt_starter/widgets/custom_textfield.dart';
import 'package:jwt_starter/widgets/custom_textfield_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  RegisterViewModel registerViewModel = RegisterViewModel();
  late final RegisterModel register;

  @override
  void initState() {
    super.initState();

    register = RegisterModel(); // Initialize register variable here
  }

  bool _isChecked = false;

  //passwword controller for email and password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(24.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                30.verticalSpace,
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 25.sp,
                        width: 25.sp,
                      ),
                      10.horizontalSpace,
                      Text(
                        "D Commerce",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: "DancingScript",
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sign in to your ",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "RobotoCondensed",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "RobotoCondensed",
                    ),
                  ),
                ),
                10.verticalSpace,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Enter your email and password to log in.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: "RobotoCondensed",
                    ),
                  ),
                ),
                20.verticalSpace,
                const CustomTextFieldLabel(
                  labelText: "Email*",
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                CustomStyledTextField(
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!isValidEmail(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  onValidationChanged: (isValid) {
                    setState(() {
                      isEmailValid = isValid;
                    });
                  },
                  errorText:
                      isEmailValid ? null : "Enter a valid email address",
                ),
                20.verticalSpace,
                const CustomTextFieldLabel(
                  labelText: "Password*",
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                CustomStyledTextField(
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true, // Hides the input text
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                  onValidationChanged: (isValid) {
                    setState(() {
                      isPasswordValid = isValid;
                    });
                  },
                  errorText: isPasswordValid
                      ? null
                      : "Password must be at least 8 characters",
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                          print(
                              "Remember me is tapped so credetials will be saved..."); // Toggle the state when tapped
                        });
                      },
                      child: Container(
                        width: 16.sp,
                        height: 16.sp,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                          color: _isChecked ? Colors.green : Colors.transparent,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: _isChecked
                              ? Icon(
                                  Icons.check,
                                  size: 16.sp,
                                  color: Colors.white,
                                  key: ValueKey<bool>(_isChecked),
                                )
                              : Container(
                                  key: ValueKey<bool>(
                                      _isChecked)), // Empty container when unchecked
                        ),
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        fontFamily: "RobotoCondensed",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    65.horizontalSpace,
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: "RobotoCondensed",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                CustomElevatedButtonWithIcon(
                  backgroundColor: Colors.black,
                  height: 50.0.sp,
                  width: 350.0.sp,
                  icon: Icons.login_outlined,
                  text: "Login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      register.email = emailController.text;
                      register.password = passwordController.text;

                      await registerViewModel.loginUser(
                          context, register, _isChecked);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "RobotoCondensed",
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
