import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nusantara_eats/data/recipe_data.dart';
import 'package:nusantara_eats/models/recipe.dart';
import 'package:nusantara_eats/screens/detail_screen.dart';
import 'package:nusantara_eats/theme/app_theme.dart';
import 'package:nusantara_eats/widgets/category_chip.dart';
import 'package:nusantara_eats/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';
  String _selectedCategory = 'Semua';

  final List<String> _categories = const [
    'Semua',
    'Jawa',
    'Sumatera',
    'Bali',
    'Jakarta',
  ];

  List<Recipe> get _filteredRecipes {
    return recipes.where((recipe) {
      final matchQuery =
          recipe.name.toLowerCase().contains(_query.toLowerCase()) ||
          recipe.origin.toLowerCase().contains(_query.toLowerCase());
      final matchCategory = _matchCategory(recipe);
      return matchQuery && matchCategory;
    }).toList();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure status bar icons stay visible over light backgrounds in this screen
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    final header = Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: Colors.black.a * 0.08),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, Foodie! 👋',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Mau masak apa hari ini?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _searchCtrl,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.18),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: 'Cari resep atau asal daerah',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
              ),
              suffixIcon: _query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _query = '';
                          _searchCtrl.clear();
                        });
                      },
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.22),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.35),
                  width: 1.2,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            onChanged: (value) => setState(() => _query = value),
          ),
        ],
      ),
    );

    final chips = SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _categories
            .map(
              (cat) => CategoryChip(
                label: cat,
                selected: _selectedCategory == cat,
                onTap: () => setState(() => _selectedCategory = cat),
              ),
            )
            .toList(),
      ),
    );

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              sliver: SliverToBoxAdapter(child: header),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: chips),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.crossAxisExtent;
                  final items = _filteredRecipes;
                  final isWide = width >= 720;

                  if (!isWide) {
                    final itemCount = items.isEmpty
                        ? 0
                        : (items.length * 2 - 1);
                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index.isOdd) return const SizedBox(height: 14);
                        final itemIndex = index ~/ 2;
                        final recipe = items[itemIndex];
                        return AnimationConfiguration.staggeredList(
                          position: itemIndex,
                          duration: const Duration(milliseconds: 400),
                          child: SlideAnimation(
                            verticalOffset: 30,
                            child: FadeInAnimation(
                              child: RecipeCard(
                                recipe: recipe,
                                onTap: () => _openDetail(recipe),
                              ),
                            ),
                          ),
                        );
                      }, childCount: itemCount),
                    );
                  }

                  final crossAxisCount = (width / 320).floor().clamp(2, 4);

                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.05,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final recipe = items[index];
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: crossAxisCount,
                        position: index,
                        duration: const Duration(milliseconds: 400),
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: RecipeCard(
                              recipe: recipe,
                              onTap: () => _openDetail(recipe),
                            ),
                          ),
                        ),
                      );
                    }, childCount: items.length),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openDetail(Recipe recipe) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(recipe: recipe)),
    );
    setState(() {});
  }

  bool _matchCategory(Recipe recipe) {
    switch (_selectedCategory) {
      case 'Jawa':
        return recipe.origin.toLowerCase().contains('jawa') ||
            recipe.origin.toLowerCase().contains('yogyakarta');
      case 'Sumatera':
        return recipe.origin.toLowerCase().contains('sumatera') ||
            recipe.origin.toLowerCase().contains('padang') ||
            recipe.origin.toLowerCase().contains('palembang');
      case 'Bali':
        return recipe.origin.toLowerCase().contains('bali');
      case 'Jakarta':
        return recipe.origin.toLowerCase().contains('jakarta');
      default:
        return true;
    }
  }
}
