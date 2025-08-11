import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';

class AppMenuItemImage extends StatelessWidget {
  final String? imageUrl;
  final bool isFavorite;

  const AppMenuItemImage({
    super.key,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 134,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  width: 134,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return _placeholder();
                  },
                ),
              )
            else
              _placeholder(),
            if (isFavorite) _favoriteBadge(),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey[200],
      child: Icon(Icons.fastfood, size: 48, color: Colors.grey[400]),
    );
  }

  Widget _favoriteBadge() {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Icon(Icons.favorite, color: AppColors.secondaryRed, size: 12),
      ),
    );
  }
}
