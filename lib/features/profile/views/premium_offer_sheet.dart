// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/localization/app_localizations.dart';

class PremiumOfferSheet extends StatefulWidget {
  const PremiumOfferSheet({super.key});

  @override
  State<PremiumOfferSheet> createState() => _PremiumOfferSheetState();
}

class _PremiumOfferSheetState extends State<PremiumOfferSheet> {
  int _selectedPackageIndex = 1; // Orta paket varsayılan seçili

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1A1A1A),
            Color(0xFF2D1B1B),
            Color(0xFF1A1A1A),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Handle bar and close button
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                
                // Close button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content - No ScrollView needed
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section - Direct on background (no card)
                  Column(
                    children: [
                      // Title
                      Text(
                        l10n.limitedOffer,
                        style: AppTextStyles.h2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      
                      // Description
                      Text(
                        l10n.premiumDescription,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                  
                  // Bonuses Section - Dark semi-transparent card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.bonuses,
                          style: AppTextStyles.h4.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Bonus Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildBonusIcon(
                              'assets/icons/premium.png',
                              l10n.premiumAccount,
                            ),
                            _buildBonusIcon(
                              'assets/icons/daha_fazla_eslesme.png',
                              l10n.moreMatches,
                            ),
                            _buildBonusIcon(
                              'assets/icons/one_cikarma.png',
                              l10n.featured,
                            ),
                            _buildBonusIcon(
                              'assets/icons/daha_fazla_begeni.png',
                              l10n.moreLikes,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  
                 
                  Center(
                    child: 
                    Text(
                      l10n.selectTokenPackage,
                      style: AppTextStyles.h6.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Token Packages
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildTokenPackage(
                            index: 0,
                            discount: '+10%',
                            originalPrice: '200',
                            newPrice: '330',
                            price: '₺99,99',
                            frequency: l10n.weeklyPer,
                            gradient: const LinearGradient(
                              colors: [Color(0xFFDC143C), Color(0xFF8B0000)],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTokenPackage(
                            index: 1,
                            discount: '+70%',
                            originalPrice: '2.000',
                            newPrice: '3.375',
                            price: '₺799,99',
                            frequency: l10n.weeklyPer,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF8A2BE2), Color(0xFFFF69B4)],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTokenPackage(
                            index: 2,
                            discount: '+35%',
                            originalPrice: '1.000',
                            newPrice: '1.350',
                            price: '₺399,99',
                            frequency: l10n.weeklyPer,
                            gradient: const LinearGradient(
                              colors: [Color(0xFFDC143C), Color(0xFF8B0000)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Call to Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC143C),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                        shadowColor: const Color(0xFFDC143C).withOpacity(0.3),
                      ),
                      child: Text(
                        l10n.seeAllTokens,
                        style: AppTextStyles.buttonLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusIcon(String iconPath, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6F060B), Color(0xFF6F060B)],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTokenPackage({
    required int index,
    required String discount,
    required String originalPrice,
    required String newPrice,
    required String price,
    required String frequency,
    required Gradient gradient,
  }) {
    final l10n = AppLocalizations.of(context);
    final isSelected = _selectedPackageIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPackageIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          border: isSelected 
            ? Border.all(color: Colors.white, width: 2)
            : null,
          boxShadow: [
            BoxShadow(
              color: isSelected 
                ? Colors.white.withOpacity(0.3)
                : Colors.black.withOpacity(0.1),
              blurRadius: isSelected ? 15 : 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Discount Badge - Center top
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                discount,
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // Original Price (Crossed out)
            Text(
              originalPrice,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white.withOpacity(0.6),
                decoration: TextDecoration.lineThrough,
                fontSize: 12,
              ),
            ),
            
            // New Price
            Text(
              newPrice,
              style: AppTextStyles.h4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // Token Label
            Text(
              l10n.token,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Price
            Text(
              price,
              style: AppTextStyles.h5.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // Frequency
            Text(
              frequency,
              style: AppTextStyles.caption.copyWith(
                color: Colors.white.withOpacity(0.8),
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
            
            // Selection indicator
            if (isSelected) ...[
              const SizedBox(height: 8),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.check,
                  color: Color(0xFFDC143C),
                  size: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
} 