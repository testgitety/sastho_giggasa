import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GallerySlider extends StatefulWidget {
  const GallerySlider({super.key});

  @override
  State<GallerySlider> createState() => _GallerySliderState();
}

class _GallerySliderState extends State<GallerySlider> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = _currentPage + 1;
      if (nextPage >= _getSliderItems().length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  List<SliderItem> _getSliderItems() {
    return [
      SliderItem(
        assetPath: 'assets/images/health1.jpg',
        emoji: '🏥',
        title: 'স্বাস্থ্য পরীক্ষা সেবা',
        bgColor: Colors.blue[700]!,
      ),
      SliderItem(
        assetPath: 'assets/images/health2.jpg',
        emoji: '💊',
        title: 'ওষুধ ও চিকিৎসা পরামর্শ',
        bgColor: Colors.red[700]!,
      ),
      SliderItem(
        assetPath: 'assets/images/health3.jpg',
        emoji: '🩺',
        title: 'ডাক্তার পরামর্শ সেবা',
        bgColor: Colors.green[700]!,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.teal.shade700,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _getSliderItems().map((item) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.assetPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildGallerySlide(item.emoji, item.title, item.bgColor);
                  },
                ),
              );
            }).toList(),
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _getSliderItems().length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? AppColors.accent
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGallerySlide(String emoji, String title, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 60),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class SliderItem {
  final String assetPath;
  final String emoji;
  final String title;
  final Color bgColor;

  SliderItem({
    required this.assetPath,
    required this.emoji,
    required this.title,
    required this.bgColor,
  });
}