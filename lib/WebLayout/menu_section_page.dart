import 'package:ci_cd/Utils/res/app_colors.dart';
import 'package:flutter/material.dart';

class MenuPreview extends StatelessWidget {
  const MenuPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: const [
          MenuCard(title: 'Veg Thali', price: '₹80'),
          MenuCard(title: 'Rajma Chawal', price: '₹70'),
          MenuCard(title: 'Paneer Roll', price: '₹60'),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String price;

  const MenuCard({required this.title, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBrown)),
              const SizedBox(height: 8),
              Text(price,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.leafGreen)),
            ],
          ),
        ),
      ),
    );
  }
}
