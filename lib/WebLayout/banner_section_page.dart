import 'package:ci_cd/Utils/res/app_colors.dart';
import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.orange,
            const Color(0xFFFFC766),
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Professional Canteen\nManagement Services',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Serving institutions with hygiene, quality, and efficiency.\n'
                      'Trusted by organizations where taste meets purpose.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBrown,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 16),
                  ),
                  onPressed: () {},
                  child: const Text('Get in Touch'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 260,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
