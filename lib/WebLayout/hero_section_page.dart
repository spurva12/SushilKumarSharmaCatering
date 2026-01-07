import 'package:ci_cd/Utils/res/app_colors.dart';
import 'package:flutter/material.dart';

import 'footer_page.dart';
import 'menu_section_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeroSection(),
          MenuPreview(),
          Footer(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryOrange,
            const Color(0xFFFFC766),
          ],
        ),
      ),
      child: Column(
        children: const [
          Text(
            'Where Taste Meets Purpose',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Fresh • Hygienic • Affordable',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
