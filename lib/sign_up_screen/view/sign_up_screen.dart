import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interview/common/textformfield/custom_textformfield.dart';
import 'package:interview/sign_in_screen/view/custom_painter_widget.dart';
import 'package:interview/sign_up_screen/controller/sign_up_provider.dart';
import 'package:interview/utils/constant_colors.dart';
import 'package:provider/provider.dart';

/// This screen is used to display the
/// sign up screen to the user and if
/// the user has already account to sign in
/// then user can navigate to the registration screen.

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable for calculating the size of the divice.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              size: Size(size.width, (size.width * 0.82125).toDouble()),
              painter: CustomPainterWidget(),
              child: SizedBox(
                height: size.width * 0.92125,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.height * 0.03,
                    bottom: size.height * 0.15,
                  ),
                  // Text containing within the custom shape.
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          color: ConstantColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.075,
                        ),
                      ),
                      Text(
                        'New Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ConstantColors.whiteColor,
                          fontSize: size.width * 0.075,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Consumer<SignUpProvider>(
              builder: (context, signUpProviderValue, child) => Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TextFormField for providing the Full Name of the user.
                    CustomTextFormField(
                      obscureText: false,
                      labelText: 'Full Name',
                      hintText: 'aaaaaaa',
                      textEditingController:
                          signUpProviderValue.fullNameEditingController,
                      onTap: () {
                        if (signUpProviderValue
                            .fullNameEditingController.text.isEmpty) {
                          return 'Name required';
                        } else if (signUpProviderValue
                                .fullNameEditingController.text.length <
                            6) {
                          return 'Enter a valid full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    // TextFormField for providing the email address of the user.
                    CustomTextFormField(
                      labelText: 'Email Address',
                      hintText: 'pay@gmail.com',
                      textEditingController:
                          signUpProviderValue.emailEditingController,
                      obscureText: false,
                      onTap: () {
                        if (signUpProviderValue
                            .emailEditingController.text.isEmpty) {
                          return 'Email Address required';
                        } else if (signUpProviderValue
                                    .emailEditingController.text.length <
                                6 &&
                            signUpProviderValue.emailEditingController.text
                                .contains('.com') &&
                            signUpProviderValue.emailEditingController.text
                                .contains('@')) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    // TextFormField for providing the Mobile Number of the user.
                    CustomTextFormField(
                      labelText: 'Mobile Number',
                      hintText: '+911234567890',
                      textEditingController:
                          signUpProviderValue.mobileNumberEditingController,
                      onTap: () {
                        if (signUpProviderValue
                            .mobileNumberEditingController.text.isEmpty) {
                          return 'Password required';
                        } else if (signUpProviderValue
                                .mobileNumberEditingController.text.length <
                            6) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      obscureText: false,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    // Textbutton if the user has a Refferal Code.
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Have a Refferal Code ?',
                        style: TextStyle(
                          color: ConstantColors.redColor,
                          fontSize: size.height * 0.023,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    // Button for register the user.
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width / 2.5,
                            height: size.height * 0.05,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ConstantColors.redColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: const Text('Register account'),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          // The below RichText is for navigating to the
                          // Sign in screen if the user has an account.
                          RichText(
                            text: TextSpan(
                              text: 'Or',
                              style: const TextStyle(
                                color: ConstantColors.blackColor,
                              ),
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: size.width * 0.01),
                                ),
                                TextSpan(
                                  text: 'Sign in',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ConstantColors.blackColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (() => Navigator.pop(context)),
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: size.width * 0.01),
                                ),
                                const TextSpan(
                                  text: 'with your new account',
                                  style: TextStyle(
                                    color: ConstantColors.blackColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
