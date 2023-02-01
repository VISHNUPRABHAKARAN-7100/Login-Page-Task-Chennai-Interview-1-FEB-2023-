import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interview/common/textformfield/custom_textformfield.dart';
import 'package:interview/sign_in_screen/controller/sign_in_provider.dart';
import 'package:interview/utils/constant_colors.dart';
import 'package:provider/provider.dart';
import '../../sign_up_screen/view/sign_up_screen.dart';
import 'custom_painter_widget.dart';

/// This screen is used to display the
/// Sign In page to the user and
/// if the user has no account to sign in
/// then user can navigate to registration page.

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable for calculating the size of the divice.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calling the widget of custom shape
            CustomPaint(
              size: Size(size.width, (size.width * 0.82125).toDouble()),
              painter: CustomPainterWidget(),
              child: SizedBox(
                height: size.width * 0.92125,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.03, bottom: size.height * 0.15),
                  // Text containing within the custom shape.
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: ConstantColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.1,
                        ),
                      ),
                      Text(
                        'Please login to using the App',
                        style: TextStyle(
                          color: ConstantColors.whiteColor,
                          fontSize: size.width * 0.05,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Consumer<SignInProvider>(
              builder: (context, signInProviderValue, child) => Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  children: [
                    // TextFormField for providing the email address of the user.
                    CustomTextFormField(
                      obscureText: false,
                      labelText: 'Email Address',
                      hintText: 'pay@gmail.com',
                      textEditingController:
                          signInProviderValue.emailEditingController,
                      onTap: () {
                        if (signInProviderValue
                            .emailEditingController.text.isEmpty) {
                          return 'Email Address required';
                        } else if (signInProviderValue
                                    .emailEditingController.text.length <
                                6 &&
                            signInProviderValue.emailEditingController.text
                                .contains('.com') &&
                            signInProviderValue.emailEditingController.text
                                .contains('@')) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    // TextFormField for providing the password of the user.
                    CustomTextFormField(
                      obscureText: true,
                      labelText: 'Password',
                      hintText: '**************',
                      onTap: () {
                        if (signInProviderValue
                            .passwordEditingController.text.isEmpty) {
                          return 'Password required';
                        } else if (signInProviderValue
                                .passwordEditingController.text.length <
                            6) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      textEditingController:
                          signInProviderValue.passwordEditingController,
                      suffixIconButton: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                    ),
                    // The below Row is for showing the
                    // rememver checkboxe and Forgot Password button.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          activeColor:  ConstantColors.redColor,
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text(
                          'Remember',
                          style: TextStyle(
                            fontSize: size.height * 0.023,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color:  ConstantColors.redColor,
                              fontSize: size.height * 0.023,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      width: size.width / 2.5,
                      height: size.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  ConstantColors.redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Sign In'),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // The below RichText is for navigating to the
                    // Sign up screen if the user has no account.
                    RichText(
                      text: TextSpan(
                        text: 'Or',
                        style: const TextStyle(
                          color:  ConstantColors.redColor,
                        ),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(width: size.width * 0.01),
                          ),
                          TextSpan(
                            text: 'Register a new account',
                            style: const TextStyle(
                              color: ConstantColors.blackColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
