import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import 'login_screen.dart';
//Account Screen
class AccountScreen extends StatelessWidget {
  final VoidCallback? onLogout;

  const AccountScreen({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //user info
              Padding(
                padding: const EdgeInsets.all(AppDimensions.screenPaddingH),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.profileImageSize,
                      height: AppDimensions.profileImageSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                        image: const DecorationImage(
                          image: AssetImage(AppAssets.banner),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Kerolos Samy', style: AppTextStyles.headline.copyWith(fontSize: 20)),
                            const SizedBox(width: 10),
                            const Icon(Icons.edit, color: AppColors.primary, size: 20),
                          ],
                        ),
                        Text(
                          'kerolos@example.com',
                          style: AppTextStyles.subtitle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ).animate().fade().slideX(begin: -0.1),

              const Divider(color: AppColors.border),

              // ── قائمة الخيارات ──
              ..._buildMenuItems(context),

              const SizedBox(height: 30),
              //logout
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    height: AppDimensions.buttonHeight,
                    decoration: BoxDecoration(
                      color: AppColors.logoutButton,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: AppColors.primary),
                        const SizedBox(width: 20),
                        Text(
                          AppStrings.logOut,
                          style: AppTextStyles.headline.copyWith(
                            color: AppColors.primary,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animate().fade(delay: 500.ms).slideY(begin: 0.2),
              const SizedBox(height: AppDimensions.bottomNavSafeArea),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final items = [
      (Icons.shopping_bag_outlined, AppStrings.orders),
      (Icons.perm_identity, AppStrings.myDetails),
      (Icons.location_on_outlined, AppStrings.deliveryAddress),
      (Icons.payment, AppStrings.paymentMethods),
      (Icons.local_offer_outlined, AppStrings.promoCode),
      (Icons.notifications_none, AppStrings.notifications),
      (Icons.help_outline, AppStrings.help),
      (Icons.info_outline, AppStrings.about),
    ];

    return items.asMap().entries.expand((entry) {
      final index = entry.key;
      final item = entry.value;
      return [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.screenPaddingH,
            vertical: 5,
          ),
          leading: Icon(item.$1, color: AppColors.textDark, size: 28),
          title: Text(item.$2, style: AppTextStyles.productTitle.copyWith(fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.textDark, size: 20),
          onTap: () {},
        ).animate().fade(delay: (100 + index * 50).ms).slideX(begin: 0.05),
        const Divider(color: AppColors.border),
      ];
    }).toList();
  }
}
