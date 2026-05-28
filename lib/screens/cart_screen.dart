import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/custom_button.dart';

//Cart Screen
class CartScreen extends StatelessWidget {
  final List<CartItem> items;
  final void Function(String productId) onRemoveItem;
  final void Function(String productId, int quantity) onUpdateQuantity;

  const CartScreen({
    super.key,
    required this.items,
    required this.onRemoveItem,
    required this.onUpdateQuantity,
  });

  double get _totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.myCart, style: AppTextStyles.headline.copyWith(fontSize: 20))
            .animate().fade().slideY(begin: -0.2),
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: AppColors.textGrey.withOpacity(0.3)),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.cartEmpty,
                    style: AppTextStyles.subtitle.copyWith(fontSize: 18),
                  ),
                ],
              ).animate().fade().scale(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final cartItem = items[index];
                      return Dismissible(
                        key: Key(cartItem.product.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                          ),
                          child: const Icon(Icons.delete_outline, color: Colors.red, size: 30),
                        ),
                        onDismissed: (_) {
                          onRemoveItem(cartItem.product.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppStrings.itemRemoved),
                              backgroundColor: AppColors.snackBar,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        },
                        child: CartItemCard(
                          item: cartItem,
                          onQuantityChanged: (qty) => onUpdateQuantity(cartItem.product.id, qty),
                          onRemove: () => onRemoveItem(cartItem.product.id),
                        ),
                      ).animate().fade(delay: (index * 100).ms).slideX(begin: 0.1);
                    },
                  ),
                ),

                // ── زر الدفع ──
                Container(
                  padding: EdgeInsets.fromLTRB(
                    AppDimensions.screenPaddingH,
                    20,
                    AppDimensions.screenPaddingH,
                    AppDimensions.bottomNavSafeArea,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, -5),
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: GradientButton(
                    text: AppStrings.goToCheckout,
                    trailingText: '\$${_totalPrice.toStringAsFixed(2)}',
                    onPressed: () {
                      // TODO: payment screen
                    },
                  ),
                ).animate().slideY(begin: 1.0, duration: 500.ms, curve: Curves.easeOutCubic),
              ],
            ),
    );
  }
}
