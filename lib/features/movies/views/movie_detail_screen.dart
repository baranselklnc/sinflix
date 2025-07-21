// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/localization/app_localizations.dart';
import '../controllers/movie_controller.dart';
import '../../../shared/models/movie_models.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  final String movieId;
  final MovieModel? initialMovie;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
    this.initialMovie,
  });

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  int _selectedImageIndex = 0;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialMovie != null) {
      _isFavorite = widget.initialMovie!.isFavorite ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);
    
    // Mevcut film verilerini kullan
    final movie = widget.initialMovie ?? 
                  ref.read(movieControllerProvider.notifier).getMovieDetail(widget.movieId);

    if (movie == null) {
      return Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.onBackground.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              // ignore: duplicate_ignore
              // ignore: deprecated_member_use
              child: Icon(Icons.arrow_back, color: colorScheme.onBackground),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.userNotFound,
                style: TextStyle(color: colorScheme.error, fontSize: 18),
              ),
            ],
          ),
        ),
      );
    }

    _isFavorite = movie.isFavorite ?? false;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            pinned: true,
            backgroundColor: colorScheme.background,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.onBackground.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.arrow_back, color: colorScheme.onBackground),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.onBackground.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? colorScheme.primary : colorScheme.onBackground,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  ref.read(movieControllerProvider.notifier).toggleFavorite(movie.id);
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Hero Image
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: _getSecureImageUrl(movie.poster ?? ''),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => _buildImagePlaceholder(colorScheme),
                      errorWidget: (context, url, error) => _buildImagePlaceholder(colorScheme),
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
                            colorScheme.background.withOpacity(0.3),
                            colorScheme.background.withOpacity(0.7),
                            colorScheme.background.withOpacity(0.9),
                          ],
                          stops: const [0.0, 0.4, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Movie Info Overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Year
                          Text(
                            movie.title,
                            style: AppTextStyles.h2.copyWith(
                              color: colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.year,
                            style: AppTextStyles.h5.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Rating and Runtime
                          Row(
                            children: [
                              if (movie.imdbRating != null && movie.imdbRating != 'N/A') ...[
                                _buildRatingChip('⭐ ${movie.imdbRating}', AppColors.warning, colorScheme),
                                const SizedBox(width: 12),
                              ],
                              if (movie.runtime != null && movie.runtime != 'N/A') ...[
                                _buildRatingChip('⏱️ ${movie.runtime}', AppColors.info, colorScheme),
                                const SizedBox(width: 12),
                              ],
                              if (movie.rated != null && movie.rated != 'N/A') ...[
                                _buildRatingChip(movie.rated!, colorScheme.primary, colorScheme),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plot Section
                  _buildSection(
                    l10n.plot,
                    movie.plot ?? l10n.noDescription,
                    Icons.description,
                    colorScheme,
                  ),
                  const SizedBox(height: 24),
                  
                  // Details Section
                  _buildDetailsSection(movie, colorScheme),
                  const SizedBox(height: 24),
                  
                  // Images Gallery
                  if (movie.images != null && movie.images!.isNotEmpty) ...[
                    _buildImagesGallery(movie.images!, colorScheme),
                    const SizedBox(height: 24),
                  ],
                  
                  // Awards Section
                  if (movie.awards != null && movie.awards != 'N/A') ...[
                    _buildSection(
                      l10n.awards,
                      movie.awards!,
                      Icons.emoji_events,
                      colorScheme,
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(ColorScheme colorScheme) {
    final l10n = AppLocalizations.of(context);
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
              l10n.loading,
              style: AppTextStyles.h4.copyWith(
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingChip(String text, Color color, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 24),
            const SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyles.h4.copyWith(
                color: colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: AppTextStyles.bodyMedium.copyWith(
            color: colorScheme.onSurface.withOpacity(0.8),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(MovieModel movie, ColorScheme colorScheme) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.info_outline, color: colorScheme.primary, size: 24),
            const SizedBox(width: 8),
            Text(
              l10n.details,
              style: AppTextStyles.h4.copyWith(
                color: colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDetailRow(l10n.genre, movie.genre ?? l10n.noGenre, colorScheme),
        _buildDetailRow(l10n.director, movie.director ?? l10n.noTitle, colorScheme),
        _buildDetailRow(l10n.writer, movie.writer ?? l10n.noTitle, colorScheme),
        _buildDetailRow(l10n.actors, movie.actors ?? l10n.noTitle, colorScheme),
        _buildDetailRow(l10n.language, movie.language ?? l10n.noTitle, colorScheme),
        _buildDetailRow(l10n.country, movie.country ?? l10n.noTitle, colorScheme),
        if (movie.metascore != null && movie.metascore != 'N/A')
          _buildDetailRow(l10n.metascore, movie.metascore!, colorScheme),
        if (movie.imdbVotes != null && movie.imdbVotes != 'N/A')
          _buildDetailRow(l10n.imdbVotes, movie.imdbVotes!, colorScheme),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesGallery(List<String> images, ColorScheme colorScheme) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.photo_library, color: colorScheme.primary, size: 24),
            const SizedBox(width: 8),
            Text(
              l10n.gallery,
              style: AppTextStyles.h4.copyWith(
                color: colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Main Image
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: _getSecureImageUrl(images[_selectedImageIndex]),
              fit: BoxFit.cover,
              placeholder: (context, url) => _buildImagePlaceholder(colorScheme),
              errorWidget: (context, url, error) => _buildImagePlaceholder(colorScheme),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Thumbnail Images
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedImageIndex = index;
                  });
                },
                child: Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _selectedImageIndex == index 
                          ? colorScheme.primary 
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: _getSecureImageUrl(images[index]),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: colorScheme.surface,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: colorScheme.surface,
                        child: Icon(Icons.error, color: colorScheme.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
} 