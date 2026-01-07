import 'package:flutter/material.dart';

class SpecialSection extends StatelessWidget {
  const SpecialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.green.shade50,
      padding: const EdgeInsets.all(32),
      child: const Column(
        children: [
          Text(
            "Today's Special",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Rajma Chawal - ₹70',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
