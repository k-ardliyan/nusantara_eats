import 'package:flutter/material.dart';
import 'package:nusantara_eats/theme/app_theme.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
    this.size = 16,
  });

  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    final filled = rating.floor();
    final hasHalf = (rating - filled) >= 0.5;
    final total = 5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (index) {
        if (index < filled) {
          return Icon(Icons.star, color: AppTheme.accentColor, size: size);
        }
        if (hasHalf && index == filled) {
          return Icon(Icons.star_half, color: AppTheme.accentColor, size: size);
        }
        return Icon(Icons.star_border, color: AppTheme.accentColor, size: size);
      }),
    );
  }
}

