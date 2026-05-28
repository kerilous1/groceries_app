import 'package:flutter/material.dart';
import '../core/app_theme.dart';

///Home Category Card
class HomeCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;

  const HomeCategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: AppDimensions.categoryCardWidth + 45,
        margin: const EdgeInsets.only(bottom: 10, top: 5, left: 4, right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              child: Image.asset(imagePath, width: 45, height: 45, fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
