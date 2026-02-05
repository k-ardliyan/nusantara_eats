import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nusantara_eats/data/recipe_data.dart';
import 'package:nusantara_eats/screens/about_screen.dart';
import 'package:nusantara_eats/screens/coming_soon_screen.dart';
import 'package:nusantara_eats/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  int get _favoriteCount => recipes.where((r) => r.isFavorite).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Profil',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person_rounded,
                    size: 56,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Name
              Text(
                'Foodie User',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Pecinta Kuliner Nusantara',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 32),
              // Stats - Connected to actual data
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(
                      icon: Icons.favorite_rounded,
                      label: 'Favorit',
                      value: '$_favoriteCount',
                      color: AppTheme.heartRed,
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: AppTheme.dividerColor,
                    ),
                    _StatItem(
                      icon: Icons.restaurant_menu_rounded,
                      label: 'Resep',
                      value: '${recipes.length}',
                      color: AppTheme.primaryColor,
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: AppTheme.dividerColor,
                    ),
                    _StatItem(
                      icon: Icons.place_rounded,
                      label: 'Daerah',
                      value: '${_uniqueRegions.length}',
                      color: AppTheme.accentColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Menu Items
              _MenuItem(
                icon: Icons.settings_rounded,
                label: 'Pengaturan',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ComingSoonScreen(
                      title: 'Pengaturan',
                      icon: Icons.settings_rounded,
                      subtitle:
                          'Fitur pengaturan akan segera hadir! Anda akan dapat menyesuaikan tema, notifikasi, dan preferensi lainnya.',
                    ),
                  ),
                ),
              ),
              _MenuItem(
                icon: Icons.help_outline_rounded,
                label: 'Bantuan',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ComingSoonScreen(
                      title: 'Bantuan',
                      icon: Icons.help_outline_rounded,
                      subtitle:
                          'Pusat bantuan sedang dalam pengembangan. FAQ, panduan penggunaan, dan dukungan pelanggan akan segera tersedia.',
                    ),
                  ),
                ),
              ),
              _MenuItem(
                icon: Icons.info_outline_rounded,
                label: 'Tentang Aplikasi',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Set<String> get _uniqueRegions {
    return recipes.map((r) {
      // Extract main region from origin string
      final origin = r.origin.toLowerCase();
      if (origin.contains('jawa')) {
        return 'Jawa';
      }
      if (origin.contains('sumatera') ||
          origin.contains('padang') ||
          origin.contains('palembang')) {
        return 'Sumatera';
      }
      if (origin.contains('bali')) {
        return 'Bali';
      }
      if (origin.contains('jakarta')) {
        return 'Jakarta';
      }
      return r.origin;
    }).toSet();
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppTheme.primaryColor, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppTheme.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
