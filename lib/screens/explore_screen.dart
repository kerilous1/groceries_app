import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_theme.dart';
import '../widgets/explore_category_card.dart';

//Explore Screen
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.findProducts, style: AppTextStyles.headline.copyWith(fontSize: 20))
            .animate().fade().slideY(begin: -0.2),
      ),
      body: Column(
        children: [
          // search
          Padding(
            padding: const EdgeInsets.all(AppDimensions.screenPaddingH),
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
          ).animate().fade(delay: 100.ms).slideY(begin: -0.2),

          //category
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.screenPaddingH,
                0,
                AppDimensions.screenPaddingH,
                AppDimensions.bottomNavSafeArea,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppDimensions.exploreCrossAxisCount,
                crossAxisSpacing: AppDimensions.exploreGridSpacing,
                mainAxisSpacing: AppDimensions.exploreGridSpacing,
                childAspectRatio: AppDimensions.exploreCategoryAspectRatio,
              ),
              itemCount: MockData.exploreCategories.length,
              itemBuilder: (context, index) {
                final category = MockData.exploreCategories[index];
                return ExploreCategoryCard(
                  title: category.title,
                  imagePath: category.imagePath,
                  color: category.color,
                ).animate().fade(delay: (200 + index * 100).ms).scale(begin: const Offset(0.8, 0.8));
              },
            ),
          ),
        ],
      ),
    );
  }
}
