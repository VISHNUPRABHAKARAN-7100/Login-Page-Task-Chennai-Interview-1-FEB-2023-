import 'package:flutter/material.dart';
import 'package:interview/sign_in_screen/controller/sign_in_provider.dart';
import 'package:interview/sign_up_screen/controller/sign_up_provider.dart';
import 'package:interview/splash_screen/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
