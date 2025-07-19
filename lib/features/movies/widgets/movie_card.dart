import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/models/movie_models.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onFavoriteToggle;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.overlay,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster with Favorite Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                                        child: CachedNetworkImage(
                        imageUrl: movie.poster ?? '',
                        fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.secondary,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.secondary,
                      child: const Icon(
                        Icons.movie,
                        color: AppColors.textSecondary,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
              // Favorite Button
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.overlay,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      (movie.isFavorite ?? false) ? Icons.favorite : Icons.favorite_border,
                      color: (movie.isFavorite ?? false) ? AppColors.primary : AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Movie Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Year
                Row(
                  children: [
                    Expanded(
                      child:                     Text(
                      movie.title ?? 'Başlık Yok',
                      style: AppTextStyles.movieTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:                     Text(
                      movie.year ?? 'Yıl Yok',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Genre and Runtime
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movie.genre ?? 'Tür Yok',
                        style: AppTextStyles.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      movie.runtime ?? 'Süre Yok',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Plot
                Text(
                  movie.plot ?? 'Açıklama Yok',
                  style: AppTextStyles.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                
                // Rating and Director
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.warning,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.imdbRating ?? 'Rating Yok',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Yönetmen: ${movie.director ?? 'Bilinmiyor'}',
                        style: AppTextStyles.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 