import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/favorite_item_card.dart';
import '../widgets/custom_button.dart';

//Favorite Screen
class FavoriteScreen extends StatelessWidget {
  final List<Product> favorites;
  final void Function(Product product) onToggleFavorite;
  final VoidCallback onAddAllToCart;

  const FavoriteScreen({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
    required this.onAddAllToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.favourites, style: AppTextStyles.headline.copyWith(fontSize: 20))
            .animate().fade().slideY(begin: -0.2),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: AppColors.textGrey.withOpacity(0.3)),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.noFavorites,
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
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final product = favorites[index];
                      return Dismissible(
                        key: Key(product.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                          ),
                          child: const Icon(Icons.favorite_border, color: Colors.red, size: 30),
                        ),
                        onDismissed: (_) => onToggleFavorite(product),
                        child: FavoriteItemCard(product: product),
                      ).animate().fade(delay: (index * 100).ms).slideX(begin: -0.1);
                    },
                  ),
                ),

                //buttom add all to cart
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppDimensions.screenPaddingH,
                    10,
                    AppDimensions.screenPaddingH,
                    AppDimensions.bottomNavSafeArea,
                  ),
                  child: GradientButton(
                    text: AppStrings.addAllToCart,
                    onPressed: () {
                      onAddAllToCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.shopping_cart, color: Colors.white),
                              const SizedBox(width: 12),
                              Text(AppStrings.allItemsAdded),
                            ],
                          ),
                          backgroundColor: AppColors.snackBar,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  ),
                ).animate().slideY(begin: 1.0, duration: 500.ms, curve: Curves.easeOutCubic),
              ],
            ),
    );
  }
}
