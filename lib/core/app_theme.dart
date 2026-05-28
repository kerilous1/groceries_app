import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  // main colors
  static const Color primary = Color(0xFF53B175);
  static const Color primaryLight = Color(0xFF6EDC97);
  static const Color accent = Color(0xFFF3603F);

  //Text colo
  static const Color textDark = Color(0xFF181725);
  static const Color textGrey = Color(0xFF7C7C7C);

  //background colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color searchInput = Color(0xFFF2F3F2);
  static const Color productBg = Color(0xFFD7E8D7);
  static const Color logoutButton = Color(0xFFF2F3F2);

  // other colors
  static const Color border = Color(0xFFE2E2E2);
  static const Color snackBar = Color(0xFF222222);

  // category colors
  static const Color categoryOrange = Color(0xFFF8A44C);
  static const Color categoryPurple = Color(0xFFB7A4E0);
  static const Color categoryYellow = Color(0xFFF7E28B);
  static const Color categoryBlue = Color(0xFFA1C9E8);
  static const Color categoryRed = Color(0xFFD3B0B0);
}

//Text Styles

class AppTextStyles {
  AppTextStyles._();

  static TextStyle headline = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textGrey,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle productTitle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static TextStyle productPrice = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );
}

class AppDimensions {
  AppDimensions._();

  //
  static const double screenPaddingH = 25.0;
  static const double bottomNavSafeArea = 120.0;

  //buttons
  static const double buttonHeight = 65.0;
  static const double buttonRadius = 19.0;
  static const double capsuleRadius = 35.0;

  //cardes
  static const double productCardWidth = 173.0;
  static const double productListHeight = 260.0;
  static const double categoryCardWidth = 175.0;
  static const double categoryListHeight = 200.0;
  static const double homeCategoryListHeight = 105.0;

  //radius
  static const double radiusSmall = 12.0;
  static const double radiusMedium = 15.0;
  static const double radiusLarge = 20.0;
  static const double radiusXL = 25.0;

  //banner
  static const double bannerHeight = 115.0;

  //search
  static const double searchBarHeight = 55.0;

  //logos
  static const double splashLogoWidth = 220.0;
  static const double authLogoWidth = 50.0;
  static const double headerLogoWidth = 30.0;

  //product
  static const double productImageHeight = 300.0;
  static const double cartItemImageSize = 75.0;
  static const double favoriteItemImageSize = 70.0;

  //profile
  static const double profileImageSize = 65.0;

  // navigation bar
  static const double navIconSize = 30.0;
  static const double navCenterIconSize = 40.0;
  static const double navBarHeight = 65.0;

  //add Button
  static const double addButtonSize = 42.0;
  static const double addButtonRadius = 14.0;

  //Explore
  static const double exploreCategoryAspectRatio = 0.85;
  static const int exploreCrossAxisCount = 2;
  static const double exploreGridSpacing = 15.0;
}

class AppDurations {
  AppDurations._();

  static const Duration splash = Duration(seconds: 3);
  static const Duration fade = Duration(milliseconds: 500);
  static const Duration stagger = Duration(milliseconds: 80);
  static const Duration navBarAnimation = Duration(milliseconds: 400);
  static const Duration snackBar = Duration(milliseconds: 1500);
}

//assets
class AppAssets {
  AppAssets._();

  // logo
  static const String logoWhite = 'assets/images/logo_white.png';
  static const String logoColored = 'assets/images/logo_colored.png';

  //backgrounds
  static const String onboardingBg = 'assets/images/onboarding_bg.jpg';
  static const String banner = 'assets/images/banner.png';
  static const String homeBanner = 'assets/images/home_banner.png';

  // products
  static const String apple = 'assets/images/apple.png';
  static const String banana = 'assets/images/banana.png';
  static const String pepper = 'assets/images/pepper.png';
  static const String ginger = 'assets/images/ginger.png';
  static const String beef = 'assets/images/beef.png';
  static const String chicken = 'assets/images/chicken.png';
  static const String eggsRed = 'assets/images/eggs_red.png';
  static const String eggsWhite = 'assets/images/eggs_white.png';
  static const String mayo = 'assets/images/mayo.png';
  static const String noodles = 'assets/images/noodles.png';
  static const String pasta = 'assets/images/pasta.png';
  static const String appleJuice = 'assets/images/apple_juice.png';
  static const String orangeJuice = 'assets/images/orange_juice.png';
  static const String cokeCola = 'assets/images/coke_cola.png';
  static const String dietCoke = 'assets/images/diet_coke.png';
  static const String pepsi = 'assets/images/pepsi.png';
  static const String sprite = 'assets/images/sprite.png';

  //categories
  static const String catFruits = 'assets/images/cat_fruits.png';
  static const String catOil = 'assets/images/cat_oil.png';
  static const String catMeat = 'assets/images/cat_meat.png';
  static const String catBakery = 'assets/images/cat_bakery.png';
  static const String catDairy = 'assets/images/cat_dairy.png';
  static const String catBeverages = 'assets/images/cat_beverages.png';

  //orderSuccess
  static const String orderSuccess = 'assets/images/order_success.png';
  static const String orderFailed = 'assets/images/order_failed.png';

  //navigation bar
  static const String icShop = 'assets/icons/ic_shop.svg';
  static const String icExplore = 'assets/icons/ic_explore.svg';
  static const String icCart = 'assets/icons/ic_cart.svg';
  static const String icFavorite = 'assets/icons/ic_favorite.svg';
  static const String icAccount = 'assets/icons/ic_account.svg';
}

//App Strings
class AppStrings {
  AppStrings._();

  //app
  static const String appTitle = 'Groceries App';
  static const String searchStore = 'Search Store';
  static const String seeAll = 'See all';
  static const String defaultLocation = 'Egypt, Giza';

  //first screen
  static const String welcomeTitle = 'Welcome\nto our store';
  static const String welcomeSubtitle = 'Get your groceries in as fast as one hour';
  static const String getStarted = 'Get Started';

  //login
  static const String login = 'Login';
  static const String enterCredentials = 'Enter your email and password';
  static const String forgotPassword = 'Forgot Password?';
  static const String logIn = 'Log In';
  static const String dontHaveAccount = "Don't have an account? ";
  static const String signUpLink = 'Sign up';

  // Signup screen
  static const String signUp = 'Sign Up';
  static const String signUpSubtitle = 'Enter your credentials to continue';
  static const String termsPrefix = 'By continuing you agree to our ';
  static const String termsOfService = 'Terms of Service';
  static const String andText = ' and ';
  static const String privacyPolicy = 'Privacy Policy.';

  //field
  static const String username = 'Username';
  static const String email = 'Email';
  static const String password = 'Password';

  // home screen
  static const String exclusiveOffer = 'Exclusive Offer';
  static const String bestSelling = 'Best Selling';
  static const String groceries = 'Groceries';

  //search screen
  static const String findProducts = 'Find Products';

  //cart
  static const String myCart = 'My Cart';
  static const String cartEmpty = 'Your Cart is Empty';
  static const String goToCheckout = 'Go to Checkout';
  static const String itemRemoved = 'Item removed';

  //favorites
  static const String favourites = 'Favourites';
  static const String noFavorites = 'No favorite items yet';
  static const String addAllToCart = 'Add All To Cart';
  static const String allItemsAdded = 'All items added to cart!';

  //
  static const String orders = 'Orders';
  static const String myDetails = 'My Details';
  static const String deliveryAddress = 'Delivery Address';
  static const String paymentMethods = 'Payment Methods';
  static const String promoCode = 'Promo Code';
  static const String notifications = 'Notifications';
  static const String help = 'Help';
  static const String about = 'About';
  static const String logOut = 'Log Out';

  //
  static const String addToBasket = 'Add To Basket';
  static const String addedToBasket = 'Added to basket successfully!';
  static const String productDetail = 'Product Detail';
  static const String nutritions = 'Nutritions';
  static const String review = 'Review';
  static const String defaultDescription =
      'Apples are nutritious. Apples may be good for weight loss. '
      'Apples may be good for your heart. As part of a healthful and varied diet.';
}
//App Theme
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.background,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headline.copyWith(fontSize: 20),
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headline,
        titleMedium: AppTextStyles.subtitle,
        labelLarge: AppTextStyles.buttonText,
      ),
    );
  }
}

//Data Models
class Product {
  final String id;
  final String title;
  final String imagePath;
  final String unit;
  final double price;
  final String? description;

  const Product({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.unit,
    required this.price,
    this.description,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}

class Category {
  final String title;
  final String imagePath;
  final Color color;

  const Category({
    required this.title,
    required this.imagePath,
    required this.color,
  });
}

//fake data
class MockData {
  MockData._();

  static const List<Product> exclusiveOffers = [
    Product(id: '1', title: 'Organic Bananas', imagePath: AppAssets.banana, unit: '7pcs, Price', price: 4.99),
    Product(id: '2', title: 'Red Apple', imagePath: AppAssets.apple, unit: '1kg, Price', price: 4.99),
    Product(id: '3', title: 'Fresh Ginger', imagePath: AppAssets.ginger, unit: '250gm, Price', price: 2.99),
  ];

  static const List<Product> bestSelling = [
    Product(id: '4', title: 'Bell Pepper Red', imagePath: AppAssets.pepper, unit: '1kg, Price', price: 4.99),
    Product(id: '5', title: 'Fresh Beef Bone', imagePath: AppAssets.beef, unit: '1kg, Price', price: 12.99),
    Product(id: '6', title: 'Boiler Chicken', imagePath: AppAssets.chicken, unit: '1kg, Price', price: 8.99),
  ];

  static const List<Category> homeCategories = [
    Category(title: 'Pulses', imagePath: AppAssets.catFruits, color: AppColors.categoryOrange),
    Category(title: 'Rice', imagePath: AppAssets.catOil, color: AppColors.primary),
  ];

  static const List<Category> exploreCategories = [
    Category(title: 'Fresh Fruits\n& Vegetable', imagePath: AppAssets.catFruits, color: AppColors.primary),
    Category(title: 'Cooking Oil\n& Ghee', imagePath: AppAssets.catOil, color: AppColors.categoryOrange),
    Category(title: 'Meat & Fish', imagePath: AppAssets.catMeat, color: AppColors.accent),
    Category(title: 'Bakery & Snacks', imagePath: AppAssets.catBakery, color: AppColors.categoryPurple),
    Category(title: 'Dairy & Eggs', imagePath: AppAssets.catDairy, color: AppColors.categoryYellow),
    Category(title: 'Beverages', imagePath: AppAssets.catBeverages, color: AppColors.categoryBlue),
  ];
}
