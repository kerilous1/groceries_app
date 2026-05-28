import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/app_theme.dart';
import 'home_screen.dart';
import 'explore_screen.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'account_screen.dart';

//Main Layout
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // state
  final List<CartItem> _cartItems = [];
  final List<Product> _favorites = [];

  //cart
  void _addToCart(Product product, int quantity) {
    setState(() {
      final idx = _cartItems.indexWhere((e) => e.product.id == product.id);
      if (idx >= 0) {
        _cartItems[idx].quantity += quantity;
      } else {
        _cartItems.add(CartItem(product: product, quantity: quantity));
      }
    });
  }

  void _removeFromCart(String productId) {
    setState(() {
      _cartItems.removeWhere((e) => e.product.id == productId);
    });
  }

  void _updateCartQuantity(String productId, int quantity) {
    setState(() {
      final idx = _cartItems.indexWhere((e) => e.product.id == productId);
      if (idx >= 0) _cartItems[idx].quantity = quantity;
    });
  }

  //
  void _toggleFavorite(Product product) {
    setState(() {
      final exists = _favorites.any((p) => p.id == product.id);
      if (exists) {
        _favorites.removeWhere((p) => p.id == product.id);
      } else {
        _favorites.add(product);
      }
    });
  }

  bool _isFavorite(Product product) {
    return _favorites.any((p) => p.id == product.id);
  }

  void _addAllFavoritesToCart() {
    setState(() {
      for (final product in _favorites) {
        final idx = _cartItems.indexWhere((e) => e.product.id == product.id);
        if (idx >= 0) {
          _cartItems[idx].quantity += 1;
        } else {
          _cartItems.add(CartItem(product: product));
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(
            onAddToCart: _addToCart,
            onToggleFavorite: _toggleFavorite,
            isFavorite: _isFavorite,
          ),
          const ExploreScreen(),
          CartScreen(
            items: _cartItems,
            onRemoveItem: _removeFromCart,
            onUpdateQuantity: _updateCartQuantity,
          ),
          FavoriteScreen(
            favorites: _favorites,
            onToggleFavorite: _toggleFavorite,
            onAddAllToCart: _addAllFavoritesToCart,
          ),
          const AccountScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: AppColors.primary,
        animationDuration: AppDurations.navBarAnimation,
        height: AppDimensions.navBarHeight,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          _navIcon(AppAssets.icShop, 0),
          _navIcon(AppAssets.icExplore, 1),
          _navIcon(AppAssets.icCart, 2),
          _navIcon(AppAssets.icFavorite, 3),
          _navIcon(AppAssets.icAccount, 4),
        ],
      ),
    );
  }

  Widget _navIcon(String assetPath, int index) {
    final isSelected = _currentIndex == index;
    return SvgPicture.asset(
      assetPath,
      width: isSelected ? AppDimensions.navCenterIconSize : AppDimensions.navIconSize,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.white : AppColors.textDark,
        BlendMode.srcIn,
      ),
    );
  }
}
