import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'main_layout.dart';

//Sign Up Screen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill in all fields'),
          backgroundColor: AppColors.accent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainLayout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(AppAssets.logoColored, width: AppDimensions.authLogoWidth),
              ),
              const SizedBox(height: 70),
              Text(AppStrings.signUp, style: AppTextStyles.headline)
                  .animate().fade().slideX(begin: -0.2),
              const SizedBox(height: 10),
              Text(AppStrings.signUpSubtitle, style: AppTextStyles.subtitle)
                  .animate().fade(delay: 100.ms).slideX(begin: -0.2),
              const SizedBox(height: 40),
              CustomTextField(
                label: AppStrings.username,
                controller: _usernameController,
              ).animate().fade(delay: 200.ms).slideY(begin: 0.2),
              const SizedBox(height: 30),
              CustomTextField(
                label: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ).animate().fade(delay: 300.ms).slideY(begin: 0.2),
              const SizedBox(height: 30),
              CustomTextField(
                label: AppStrings.password,
                isPassword: true,
                controller: _passwordController,
              ).animate().fade(delay: 400.ms).slideY(begin: 0.2),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.subtitle.copyWith(fontSize: 14),
                  children: [
                    const TextSpan(text: AppStrings.termsPrefix),
                    TextSpan(
                      text: '${AppStrings.termsOfService}\n',
                      style: AppTextStyles.productTitle.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                    const TextSpan(text: AppStrings.andText),
                    TextSpan(
                      text: AppStrings.privacyPolicy,
                      style: AppTextStyles.productTitle.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ).animate().fade(delay: 500.ms),
              const SizedBox(height: 30),
              CustomButton(
                text: AppStrings.signUp,
                onPressed: _handleSignUp,
              ).animate().fade(delay: 600.ms).scale(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
