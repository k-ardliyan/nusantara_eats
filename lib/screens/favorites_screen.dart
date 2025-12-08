import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nusantara_eats/data/recipe_data.dart';
import 'package:nusantara_eats/models/recipe.dart';
import 'package:nusantara_eats/screens/detail_screen.dart';
import 'package:nusantara_eats/theme/app_theme.dart';
import 'package:nusantara_eats/widgets/recipe_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = _favoriteRecipes;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Favorit',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textPrimary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            if (favorites.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: const _EmptyState(),
              )
            else ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Resep Tersimpan',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                sliver: SliverLayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.crossAxisExtent;
                    final isWide = width >= 720;

                    if (!isWide) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final recipe = favorites[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 350),
                            child: SlideAnimation(
                              verticalOffset: 24,
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index == favorites.length - 1
                                        ? 0
                                        : 14,
                                  ),
                                  child: RecipeCard(
                                    recipe: recipe,
                                    onTap: () => _openDetail(recipe),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }, childCount: favorites.length),
                      );
                    }

                    final crossAxisCount =
                        (width / 320).floor().clamp(2, 4);

                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 14,
                        childAspectRatio: 0.95,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final recipe = favorites[index];
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: crossAxisCount,
                          position: index,
                          duration: const Duration(milliseconds: 350),
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: RecipeCard(
                                recipe: recipe,
                                onTap: () => _openDetail(recipe),
                              ),
                            ),
                          ),
                        );
                      }, childCount: favorites.length),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Recipe> get _favoriteRecipes =>
      recipes.where((r) => r.isFavorite).toList();

  Future<void> _openDetail(Recipe recipe) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(recipe: recipe)),
    );
    setState(() {});
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 72, color: AppTheme.textSecondary),
          const SizedBox(height: 14),
          Text(
            'Belum ada favorit',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Simpan resep favoritmu di sini.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }
}
