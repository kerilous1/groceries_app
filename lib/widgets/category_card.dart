import 'package:flutter/material.dart';
import '../core/app_theme.dart';

//Category Card
class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
            border: Border.all(color: color.withOpacity(0.4), width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.productTitle.copyWith(
                    fontSize: 15,
                    height: 1.2,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
