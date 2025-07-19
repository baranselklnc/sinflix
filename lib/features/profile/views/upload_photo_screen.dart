import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/errors/app_exception.dart';
import '../../../core/services/dependency_injection.dart';
import '../../auth/services/auth_service.dart';

class UploadPhotoScreen extends ConsumerStatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  ConsumerState<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends ConsumerState<UploadPhotoScreen> {
  File? _selectedImage;
  bool _isUploading = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      _showErrorSnackBar('Fotoğraf seçilirken hata oluştu');
    }
  }

  Future<void> _uploadPhoto() async {
    if (_selectedImage == null) {
      _showErrorSnackBar('Lütfen bir fotoğraf seçin');
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      final authService = getIt<AuthService>();
      final photoUrl = await authService.uploadPhoto(_selectedImage!);
      
      if (mounted) {
        _showSuccessSnackBar('Fotoğraf başarıyla yüklendi');
        Navigator.pop(context, photoUrl);
      }
    } on AppException catch (e) {
      _showErrorSnackBar(e.message);
    } catch (e) {
      _showErrorSnackBar('Fotoğraf yüklenirken hata oluştu');
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Profil Detayı'),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Text(
              'Fotoğraflarınızı Yükleyin',
              style: AppTextStyles.h3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Profil fotoğrafınızı seçerek kişiselleştirin',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 40),

            // Photo Upload Area
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.secondary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: _selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 64,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Fotoğraf Seç',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Galeriden fotoğraf seçin',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedImage != null && !_isUploading ? _uploadPhoto : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isUploading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        'Devam Et',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 