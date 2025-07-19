import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../movies/controllers/movie_controller.dart';
import '../../movies/widgets/movie_hero_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    print('HomeScreen: initState called'); // Debug için
    
    // İlk yükleme
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('HomeScreen: Loading movies...'); // Debug için
      ref.read(movieControllerProvider.notifier).loadMovies(refresh: true);
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    await ref.read(movieControllerProvider.notifier).loadMovies(refresh: true);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieControllerProvider);
    
    print('HomeScreen: Movie state - ${movieState.toString()}'); // Debug için

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(
          waterDropColor: AppColors.primary,
        ),
        child: movieState.when(
          data: (movieData) {
            if (movieData == null || movieData.movies.isEmpty) {
              return const Center(
                child: Text(
                  'Henüz film bulunmuyor',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              );
            }

            return PageView.builder(
              controller: PageController(viewportFraction: 1.0),
              scrollDirection: Axis.vertical,
              itemCount: movieData.movies.length,
              onPageChanged: (index) {
                // Check if we need to load more movies
                if (index >= movieData.movies.length - 2) {
                  final movieController = ref.read(movieControllerProvider.notifier);
                  if (movieController.hasMorePages && !movieController.isLoading) {
                    movieController.loadMovies();
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
                    // TODO: Navigate to movie detail
                  },
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Bir hata oluştu',
                  style: AppTextStyles.h5.copyWith(color: AppColors.error),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(movieControllerProvider.notifier).loadMovies(refresh: true);
                  },
                  child: const Text('Tekrar Dene'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 