import 'package:ci_cd/Utils/res/app_assets.dart';
import 'package:ci_cd/Utils/res/app_colors.dart';
import 'package:ci_cd/WebLayout/services_section_page.dart';
import 'package:ci_cd/WebLayout/trust_section_page.dart';
import 'package:flutter/material.dart';

import 'banner_section_page.dart';
import 'footer_page.dart';
import 'menu_section_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(AppAssets.logo, height: 42),
            const SizedBox(width: 12),
            const Text(
              'Sushil Kumar Sharma Canteens',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: isDesktop
            ? const [
          NavItem('Home'),
          NavItem('Services'),
          NavItem('Menu'),
          NavItem('Clients'),
          NavItem('Contact'),
          SizedBox(width: 20),
        ]
            : null,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BannerSection(),
            ServicesSection(),
            MenuPreview(),
            TrustSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  const NavItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.darkBrown,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
