import 'package:flutter/material.dart';
import '../core/app_theme.dart';

///Product Card
class ProductCard extends StatelessWidget {
  final Product product;
  final String heroTag;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.heroTag,
    this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: AppDimensions.productCardWidth,
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              Center(
                child: Hero(
                  tag: heroTag,
                  child: Image.asset(product.imagePath, height: 75, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 15),

              //product name
              Text(
                product.title,
                style: AppTextStyles.productTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),

              //unit
              Text(
                product.unit,
                style: AppTextStyles.subtitle.copyWith(fontSize: 14),
              ),
              const Spacer(),

              //price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.productPrice,
                  ),
                  // add to cart
                  GestureDetector(
                    onTap: onAddToCart,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
