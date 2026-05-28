import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

//Onboarding Screen
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background
          Positioned.fill(
            child: Image.asset(AppAssets.onboardingBg, fit: BoxFit.cover),
          ),
          //
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          //texts
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(AppAssets.logoWhite, width: 50)
                      .animate().fade(duration: 500.ms).slideY(begin: 0.5, end: 0),
                  const SizedBox(height: 15),
                  Text(
                    AppStrings.welcomeTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headline.copyWith(color: Colors.white, fontSize: 40),
                  ).animate().fade(delay: 200.ms, duration: 600.ms).slideY(begin: 0.5, end: 0),
                  const SizedBox(height: 10),
                  Text(
                    AppStrings.welcomeSubtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle.copyWith(color: Colors.white.withOpacity(0.8)),
                  ).animate().fade(delay: 400.ms, duration: 600.ms).slideY(begin: 0.5, end: 0),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: AppStrings.getStarted,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  ).animate().fade(delay: 600.ms, duration: 500.ms).scale(begin: const Offset(0.8, 0.8)),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
