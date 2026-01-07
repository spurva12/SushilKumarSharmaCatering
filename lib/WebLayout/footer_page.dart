import 'package:ci_cd/Utils/res/app_colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: AppColors.darkBrown,
      child: const Center(
        child: Text(
          '© 2026 Sushil Kumar Sharma Canteens',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
