import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/models/movie_models.dart';

class MovieHeroCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;

  const MovieHeroCard({
    super.key,
    required this.movie,
    required this.onFavoriteToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8, // Ekranın %80'i
        width: double.infinity,
        child: Stack(
          children: [
            // Background Poster
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: _getSecureImageUrl(movie.poster ?? ''),
                fit: BoxFit.cover,
                placeholder: (context, url) => _buildPlaceholder(),
                errorWidget: (context, url, error) => _buildPlaceholder(),
              ),
            ),
            
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.4, 0.7, 0.85, 1.0],
                  ),
                ),
              ),
            ),
            

            
            // Movie Info at Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and Title Row
                    Row(
                      children: [
                        // Logo
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              movie.title.substring(0, 1),
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        
                        // Title
                        Expanded(
                          child: Text(
                            movie.title,
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Plot with "Daha Fazlası" button
                    _buildPlotSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            
            // Favorite Button - Film adının hizasının üstünde sağda
            Positioned(
              bottom: 200,
              right: 20,
              child: GestureDetector(
                onTap: onFavoriteToggle,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withAlpha(50),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    (movie.isFavorite ?? false) ? Icons.favorite : Icons.favorite_border,
                    color: (movie.isFavorite ?? false) ? AppColors.primary : Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSecureImageUrl(String url) {
    if (url.isEmpty) return '';
    
    // HTTP URL'lerini HTTPS'e çevir
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    
    return url;
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.secondary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie,
              color: AppColors.textSecondary,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              movie.title ?? 'Film',
              style: AppTextStyles.h4.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlotSection() {
    final plot = movie.plot ?? 'Açıklama Yok';
    final lines = plot.split('\n');
    final isLongPlot = plot.length > 100 || lines.length > 2;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          plot,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            height: 1.4,
          ),
          maxLines: isLongPlot ? 2 : null,
          overflow: isLongPlot ? TextOverflow.ellipsis : null,
        ),
        if (isLongPlot) ...[
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              // TODO: Show full plot in dialog or navigate to detail
            },
            child: Text(
              'Daha Fazlası',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
} 