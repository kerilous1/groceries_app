import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/product_card.dart';
import '../widgets/home_category_card.dart';
import 'product_details_screen.dart';

//Home Screen
class HomeScreen extends StatelessWidget {
  final void Function(Product product, int quantity) onAddToCart;
  final void Function(Product product) onToggleFavorite;
  final bool Function(Product product) isFavorite;

  const HomeScreen({
    super.key,
    required this.onAddToCart,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  void _openDetails(BuildContext context, Product product, String heroTag) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) => ProductDetailsScreen(
          product: product,
          heroTag: heroTag,
          onAddToCart: (qty) => onAddToCart(product, qty),
          initialIsFavorite: isFavorite(product),
          onToggleFavorite: () => onToggleFavorite(product),
        ),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            Text(msg),
          ],
        ),
        backgroundColor: AppColors.snackBar.withOpacity(0.9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
        duration: AppDurations.snackBar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              //logo
              Center(
                child: Image.asset(AppAssets.logoColored, width: AppDimensions.headerLogoWidth),
              ).animate().fade().slideY(begin: -0.2),
              const SizedBox(height: 10),

              //gps
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, color: AppColors.textDark, size: 20),
                  const SizedBox(width: 5),
                  Text(
                    AppStrings.defaultLocation,
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).animate().fade(delay: 100.ms).slideY(begin: -0.2),
              const SizedBox(height: 20),

              //search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                child: Container(
                  height: AppDimensions.searchBarHeight,
                  decoration: BoxDecoration(
                    color: AppColors.searchInput,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppStrings.searchStore,
                      hintStyle: AppTextStyles.subtitle,
                      prefixIcon: const Icon(Icons.search, color: AppColors.textDark),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ).animate().fade(delay: 150.ms).scale(begin: const Offset(0.95, 0.95)),
              const SizedBox(height: 20),

              //banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                child: Container(
                  height: AppDimensions.bannerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                    image: const DecorationImage(
                      image: AssetImage(AppAssets.banner),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ).animate().fade(delay: 200.ms).slideX(begin: 0.1),
              const SizedBox(height: 30),

              // offers
              _sectionHeader(AppStrings.exclusiveOffer).animate().fade(delay: 250.ms),
              const SizedBox(height: 20),
              SizedBox(
                height: AppDimensions.productListHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                  itemCount: MockData.exclusiveOffers.length,
                  itemBuilder: (context, index) {
                    final product = MockData.exclusiveOffers[index];
                    final tag = 'home_exclusive_$index';
                    return ProductCard(
                      product: product,
                      heroTag: tag,
                      onTap: () => _openDetails(context, product, tag),
                      onAddToCart: () {
                        onAddToCart(product, 1);
                        _showSnack(context, '${product.title} added to cart');
                      },
                    ).animate().fade(delay: (300 + index * 80).ms).slideX(begin: 0.15);
                  },
                ),
              ),
              const SizedBox(height: 30),

              //groceries
              _sectionHeader(AppStrings.groceries).animate().fade(delay: 350.ms),
              const SizedBox(height: 20),
              SizedBox(
                height: AppDimensions.homeCategoryListHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                  itemCount: MockData.homeCategories.length,
                  itemBuilder: (context, index) {
                    final cat = MockData.homeCategories[index];
                    return HomeCategoryCard(
                      title: cat.title,
                      imagePath: cat.imagePath,
                      backgroundColor: cat.color,
                    ).animate().fade(delay: (400 + index * 80).ms).scale();
                  },
                ),
              ),
              const SizedBox(height: 30),

              // best Selling
              _sectionHeader(AppStrings.bestSelling).animate().fade(delay: 450.ms),
              const SizedBox(height: 20),
              SizedBox(
                height: AppDimensions.productListHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                  itemCount: MockData.bestSelling.length,
                  itemBuilder: (context, index) {
                    final product = MockData.bestSelling[index];
                    final tag = 'home_best_$index';
                    return ProductCard(
                      product: product,
                      heroTag: tag,
                      onTap: () => _openDetails(context, product, tag),
                      onAddToCart: () {
                        onAddToCart(product, 1);
                        _showSnack(context, '${product.title} added to cart');
                      },
                    ).animate().fade(delay: (500 + index * 80).ms).slideX(begin: 0.15);
                  },
                ),
              ),
              const SizedBox(height: AppDimensions.bottomNavSafeArea),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.headline.copyWith(fontSize: 24)),
          Text(
            AppStrings.seeAll,
            style: AppTextStyles.productTitle.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
