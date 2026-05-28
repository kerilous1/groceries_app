import 'package:flutter/material.dart';
import '../core/app_theme.dart';

//Cart Item Card
class CartItemCard extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
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
            //image product
            Container(
              width: AppDimensions.cartItemImageSize,
              height: AppDimensions.cartItemImageSize,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.productBg,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              child: Image.asset(item.product.imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),

            // details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //titale and close
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.product.title,
                          style: AppTextStyles.productTitle.copyWith(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onRemove,
                        child: const Icon(Icons.close, color: AppColors.textGrey, size: 20),
                      ),
                    ],
                  ),
                  Text(
                    item.product.unit,
                    style: AppTextStyles.subtitle.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 12),

                  //price and quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _quantityBtn(
                            Icons.remove,
                            AppColors.textGrey,
                            () {
                              if (item.quantity > 1) onQuantityChanged(item.quantity - 1);
                            },
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '${item.quantity}',
                            style: AppTextStyles.headline.copyWith(fontSize: 16),
                          ),
                          const SizedBox(width: 15),
                          _quantityBtn(
                            Icons.add,
                            AppColors.primary,
                            () => onQuantityChanged(item.quantity + 1),
                          ),
                        ],
                      ),
                      Text(
                        '\$${item.totalPrice.toStringAsFixed(2)}',
                        style: AppTextStyles.headline.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityBtn(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.border.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
