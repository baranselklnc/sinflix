// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/localization/app_localizations.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    // ignore: unused_local_variable
    final l10n = AppLocalizations.of(context);
    
    return GestureDetector(
      onTap: onTap,
      // ignore: sized_box_for_whitespace
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
                placeholder: (context, url) => _buildPlaceholder(colorScheme),
                errorWidget: (context, url, error) => _buildPlaceholder(colorScheme),
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
                      colorScheme.background.withOpacity(0.3),
                      colorScheme.background.withOpacity(0.7),
                      colorScheme.background.withOpacity(0.9),
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
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              movie.title.substring(0, 1),
                              style: TextStyle(
                                color: colorScheme.onPrimary,
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
                              color: colorScheme.onBackground,
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
                    _buildPlotSection(context, colorScheme),
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
                    color: colorScheme.onBackground.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    (movie.isFavorite ?? false) ? Icons.favorite : Icons.favorite_border,
                    color: (movie.isFavorite ?? false) ? colorScheme.primary : colorScheme.onBackground,
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

  Widget _buildPlaceholder(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surface,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie,
              color: colorScheme.onSurface.withOpacity(0.6),
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              movie.title ?? 'Film',
              style: AppTextStyles.h4.copyWith(
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlotSection(BuildContext context, ColorScheme colorScheme) {
    final l10n = AppLocalizations.of(context);
    final plot = movie.plot ?? l10n.noDescription;
    final lines = plot.split('\n');
    final isLongPlot = plot.length > 100 || lines.length > 2;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          plot,
          style: AppTextStyles.bodyMedium.copyWith(
            color: colorScheme.onBackground,
            height: 1.4,
          ),
          maxLines: isLongPlot ? 2 : null,
          overflow: isLongPlot ? TextOverflow.ellipsis : null,
        ),
        if (isLongPlot) ...[
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _showFullPlotDialog(context, plot, colorScheme);
            },
            child: Text(
              l10n.readMore, 
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _showFullPlotDialog(BuildContext context, String plot, ColorScheme colorScheme) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          movie.title.substring(0, 1),
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        movie.title,
                        style: AppTextStyles.h4.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close,
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Plot Content
                Flexible(
                  child: SingleChildScrollView(
                    child: Text(
                      plot,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onSurface,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Close Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      l10n.close,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 