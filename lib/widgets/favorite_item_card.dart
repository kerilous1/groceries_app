import 'package:flutter/material.dart';
import '../core/app_theme.dart';

///Favorite Item Card
class FavoriteItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const FavoriteItemCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(15),
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
              //product image
              Container(
                width: AppDimensions.favoriteItemImageSize,
                height: AppDimensions.favoriteItemImageSize,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.productBg,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                child: Image.asset(product.imagePath, fit: BoxFit.contain),
              ),
              const SizedBox(width: 15),

              //name & count
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppTextStyles.productTitle.copyWith(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.unit,
                      style: AppTextStyles.subtitle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),

              //price
              Row(
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.headline.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 15),
                  const Icon(Icons.arrow_forward_ios, color: AppColors.textDark, size: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
