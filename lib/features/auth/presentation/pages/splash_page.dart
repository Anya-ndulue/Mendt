import 'package:app/features/auth/presentation/pages/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      backgroundColor: Colors.white,
      childWidget: SizedBox(
        //height: 50,
        child: Text(
          "Mendt",
          style: GoogleFonts.ubuntu(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      duration: const Duration(seconds: 7),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () => debugPrint("On Scale End"),
      nextScreen: const OnboardingPage(),
    );
  }
}
