import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'signup_screen.dart';
import 'main_layout.dart';

//Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    //simple check
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.screenPaddingH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Center(
                child: Image.asset(AppAssets.logoColored, width: AppDimensions.authLogoWidth),
              ),
              const SizedBox(height: 70),
              Text(AppStrings.login, style: AppTextStyles.headline)
                  .animate().fade().slideX(begin: -0.2),
              const SizedBox(height: 10),
              Text(AppStrings.enterCredentials, style: AppTextStyles.subtitle)
                  .animate().fade(delay: 100.ms).slideX(begin: -0.2),
              const SizedBox(height: 40),
              CustomTextField(
                label: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ).animate().fade(delay: 200.ms).slideY(begin: 0.2),
              const SizedBox(height: 30),
              CustomTextField(
                label: AppStrings.password,
                isPassword: true,
                controller: _passwordController,
              ).animate().fade(delay: 300.ms).slideY(begin: 0.2),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppStrings.forgotPassword,
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.textDark,
                    fontSize: 14,
                  ),
                ),
              ).animate().fade(delay: 400.ms),
              const SizedBox(height: 30),
              CustomButton(
                text: AppStrings.logIn,
                onPressed: _handleLogin,
              ).animate().fade(delay: 500.ms).scale(),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAccount,
                    style: AppTextStyles.productTitle.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()),
                    ),
                    child: Text(
                      AppStrings.signUp,
                      style: AppTextStyles.productTitle.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ).animate().fade(delay: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
