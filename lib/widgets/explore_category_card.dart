import 'package:flutter/material.dart';
import '../core/app_theme.dart';

///Explore Category Card
class ExploreCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;

  const ExploreCategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 15),
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.productTitle.copyWith(fontSize: 15, height: 1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
