import 'package:flutter/material.dart';
import '../core/app_theme.dart';

///Custom Button
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          ),
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.3),
        ),
        child: Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }
}

///Gradient Button for cart and favorite
class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? trailingText;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: AppDimensions.buttonHeight,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryLight],
          ),
          borderRadius: BorderRadius.circular(AppDimensions.capsuleRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              Text(text, style: AppTextStyles.buttonText),
              if (trailingText != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    trailingText!,
                    style: AppTextStyles.buttonText.copyWith(fontSize: 14),
                  ),
                )
              else
                const SizedBox(width: 40),
            ],
          ),
        ),
      ),
    );
  }
}
