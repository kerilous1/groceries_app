import 'package:flutter/material.dart';
import '../core/app_theme.dart';

//Product Details Screen
class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  final String heroTag;
  final void Function(int quantity) onAddToCart;
  final bool initialIsFavorite;
  final VoidCallback onToggleFavorite;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.heroTag,
    required this.onAddToCart,
    required this.initialIsFavorite,
    required this.onToggleFavorite,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late bool _isFavorite;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.initialIsFavorite;
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
    widget.onToggleFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //image field
                Container(
                  width: double.infinity,
                  height: AppDimensions.productImageHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.productBg,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Hero(
                      tag: widget.heroTag,
                      child: Image.asset(widget.product.imagePath, height: 180),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPaddingH,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.title,
                              style: AppTextStyles.headline.copyWith(fontSize: 24),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: _isFavorite ? Colors.red : AppColors.textGrey,
                              size: 28,
                            ),
                            onPressed: _toggleFavorite,
                          ),
                        ],
                      ),
                      Text(widget.product.unit, style: AppTextStyles.subtitle),
                      const SizedBox(height: 30),

                      //price and quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _quantityBtn(Icons.remove, AppColors.textGrey, () {
                                if (_quantity > 1) setState(() => _quantity--);
                              }),
                              const SizedBox(width: 20),
                              Text('$_quantity', style: AppTextStyles.headline.copyWith(fontSize: 18)),
                              const SizedBox(width: 20),
                              _quantityBtn(Icons.add, AppColors.primary, () {
                                setState(() => _quantity++);
                              }),
                            ],
                          ),
                          Text(
                            '\$${(widget.product.price * _quantity).toStringAsFixed(2)}',
                            style: AppTextStyles.headline.copyWith(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      //review
                      const Divider(color: AppColors.border),
                      _infoRow(AppStrings.productDetail, 'Nutritional value...', true),
                      const Divider(color: AppColors.border),
                      _infoRow(AppStrings.nutritions, '100gr', false),
                      const Divider(color: AppColors.border),
                      _infoRow(AppStrings.review, '⭐⭐⭐⭐⭐', false),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── زر الإضافة للسلة ──
          Positioned(
            bottom: 30,
            left: AppDimensions.screenPaddingH,
            right: AppDimensions.screenPaddingH,
            child: ElevatedButton(
              onPressed: () {
                widget.onAddToCart(_quantity);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppStrings.addedToBasket),
                    backgroundColor: AppColors.snackBar,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
                ),
                minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
              ),
              child: Text(AppStrings.addToBasket, style: AppTextStyles.buttonText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityBtn(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Icon(icon, color: color),
      ),
    );
  }

  Widget _infoRow(String title, String trailing, bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.productTitle),
          Row(
            children: [
              Text(trailing, style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
              const SizedBox(width: 10),
              Icon(
                isExpanded ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
