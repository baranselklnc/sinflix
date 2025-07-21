// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/localization/app_localizations.dart';
import '../../movies/controllers/movie_controller.dart';
import '../../movies/widgets/movie_hero_card.dart';
import '../../movies/views/movie_detail_screen.dart';
import 'package:sinflix/core/services/firebase_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final RefreshController _refreshController = RefreshController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    print('HomeScreen: initState called');
    
    // Firebase Analytics - Sayfa görüntüleme
    GetIt.instance<FirebaseService>().logScreenView(
      screenName: 'home_screen',
      screenClass: 'HomeScreen',
    );
    
    // İlk yükleme
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMovies();
    });
  }

  void _loadMovies() {
    print('HomeScreen: Loading movies...');
    ref.read(movieControllerProvider.notifier).loadMovies(refresh: true);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    await ref.read(movieControllerProvider.notifier).loadMovies(refresh: true);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    
    print('HomeScreen: Movie state - ${movieState.toString()}');

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        actions: [
          // Test Crash Butonu (Sadece Debug modda)
          if (kDebugMode)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                // Test crash oluştur
                GetIt.instance<FirebaseService>().recordError(
                  'Test crash from HomeScreen',
                  StackTrace.current,
                  reason: 'Manual test crash',
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.testCrashSent),
                    backgroundColor: colorScheme.primary,
                  ),
                );
              },
              tooltip: 'Test Crash',
            ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(
          waterDropColor: colorScheme.primary,
        ),
        child: movieState.when(
          data: (movieData) {
            if (movieData == null || movieData.movies.isEmpty) {
              return Center(
                child: Text(
                  l10n.loading,
                  style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
                ),
              );
            }

            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: movieData.movies.length,
              onPageChanged: (index) {

                if (index == movieData.movies.length - 1) {
                  final movieController = ref.read(movieControllerProvider.notifier);
                 

                  final isLastPage = movieData.pagination.currentPage >= movieData.pagination.maxPage;
                  
                  if (movieController.hasMorePages && !movieController.isLoading) {
                    movieController.loadMovies();
                  } else {
                    // ignore: avoid_print
                    print('HomeScreen: Skipping load - hasMorePages: ${movieController.hasMorePages}, isLoading: ${movieController.isLoading}');
                  }
                }
              },
              itemBuilder: (context, index) {
                final movie = movieData.movies[index];
                return MovieHeroCard(
                  movie: movie,
                  onFavoriteToggle: () {
                    ref.read(movieControllerProvider.notifier).toggleFavorite(movie.id);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movieId: movie.id,
                          initialMovie: movie,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            ),
          ),
          error: (error, stackTrace) => Center(
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
                  l10n.anErrorOccurred,
                  style: AppTextStyles.h5.copyWith(color: colorScheme.error),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(movieControllerProvider.notifier).loadMovies(refresh: true);
                  },
                  child: Text(l10n.tryAgain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 