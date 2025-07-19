import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).register(
        _emailController.text.trim(),
        _nameController.text.trim(),
        _passwordController.text,
      );
    }
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.secondary,
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.textPrimary,
          size: 24,
        ),
      ),
    );
  }

  void _showTermsAndConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Kullanıcı Sözleşmesi',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Text(
            'Bu Kullanıcı Sözleşmesi ("Sözleşme"), SinFlix uygulamasını kullanımınızı düzenler.\n\n'
            '1. Hizmet Kullanımı\n'
            'SinFlix, film ve dizi izleme hizmeti sunar. Hizmeti kullanarak bu sözleşmeyi kabul etmiş olursunuz.\n\n'
            '2. Hesap Güvenliği\n'
            'Hesap bilgilerinizi güvenli tutmak sizin sorumluluğunuzdadır.\n\n'
            '3. İçerik Kullanımı\n'
            'Tüm içerik telif hakkı korumalıdır ve sadece kişisel kullanım için izin verilir.\n\n'
            '4. Değişiklikler\n'
            'Bu sözleşme önceden haber verilmeksizin değiştirilebilir.\n\n'
            '5. İletişim\n'
            'Sorularınız için support@sinflix.com adresine yazabilirsiniz.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Kapat',
              style: AppTextStyles.buttonMedium.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Başarılı!',
                style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
              ),
            ),
          ],
        ),
        content: Text(
          'Hesabınız başarıyla oluşturuldu!\n\n'
          'Artık SinFlix uygulamasına giriş yapabilir ve film dünyasının keyfini çıkarabilirsiniz.',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dialog'u kapat
              Navigator.of(context).pop(); // Register ekranından çık
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Tamam',
              style: AppTextStyles.buttonMedium,
            ),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Gizlilik Politikası',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Text(
            'Bu Gizlilik Politikası, kişisel verilerinizin nasıl toplandığını ve kullanıldığını açıklar.\n\n'
            '1. Toplanan Veriler\n'
            'E-posta adresi, ad soyad ve kullanım verileri toplanır.\n\n'
            '2. Veri Kullanımı\n'
            'Verileriniz hizmet kalitesini artırmak için kullanılır.\n\n'
            '3. Veri Güvenliği\n'
            'Verileriniz güvenli sunucularda saklanır ve şifrelenir.\n\n'
            '4. Üçüncü Taraf Paylaşımı\n'
            'Verileriniz üçüncü taraflarla paylaşılmaz.\n\n'
            '5. Çerezler\n'
            'Deneyiminizi iyileştirmek için çerezler kullanılır.\n\n'
            '6. Değişiklikler\n'
            'Bu politika güncellenebilir ve değişiklikler size bildirilir.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Kapat',
              style: AppTextStyles.buttonMedium.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    
    // Başarılı kayıt sonrası dialog göster
    if (authState.hasValue && authState.value != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSuccessDialog(context);
      });
    }
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Kayıt Ol',
          style: AppTextStyles.h6,
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  Text(
                    'Hoşgeldiniz',
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Film dünyasına katılmak için hesap oluşturun',
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Name Field
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      labelText: 'Ad Soyad',
                      labelStyle: AppTextStyles.inputLabel,
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: AppColors.textSecondary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ad soyad gerekli';
                      }
                      if (value.length < 2) {
                        return 'Ad soyad en az 2 karakter olmalı';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      labelText: 'E-posta',
                      labelStyle: AppTextStyles.inputLabel,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.textSecondary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-posta adresi gerekli';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Geçerli bir e-posta adresi girin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      labelStyle: AppTextStyles.inputLabel,
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: AppColors.textSecondary,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Şifre gerekli';
                      }
                      if (value.length < 6) {
                        return 'Şifre en az 6 karakter olmalı';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      labelText: 'Şifre Tekrar',
                      labelStyle: AppTextStyles.inputLabel,
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: AppColors.textSecondary,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Şifre tekrarı gerekli';
                      }
                      if (value != _passwordController.text) {
                        return 'Şifreler eşleşmiyor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Register Button
                  ElevatedButton(
                    onPressed: authState.isLoading ? null : _handleRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: authState.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.textPrimary,
                              ),
                            ),
                          )
                        : Text(
                            'Kayıt Ol',
                            style: AppTextStyles.buttonLarge,
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Error Message
                  if (authState.hasError)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.error.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        authState.error.toString(),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 32),

                  // Social Media Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialButton(
                        icon: Icons.g_mobiledata,
                        onPressed: () {
                          // TODO: Implement Google sign up
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.apple,
                        onPressed: () {
                          // TODO: Implement Apple sign up
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.facebook,
                        onPressed: () {
                          // TODO: Implement Facebook sign up
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Terms and Conditions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            children: [
                              const TextSpan(text: 'Kayıt olarak '),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    _showTermsAndConditions(context);
                                  },
                                  child: Text(
                                    'Kullanıcı Sözleşmesi',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              const TextSpan(text: ' ve '),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    _showPrivacyPolicy(context);
                                  },
                                  child: Text(
                                    'Gizlilik Politikası',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              const TextSpan(text: '\'nı kabul etmiş olursunuz.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Zaten hesabın var mı? ',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Giriş Yap!',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 