import 'package:flutter/material.dart';

void main() {
  runApp(const CateringWebApp());
}

class CateringWebApp extends StatelessWidget {
  const CateringWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catering Services',
      theme: ThemeData(
        primaryColor: const Color(0xFF1B5E20),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopNavBar(),
            BannerSection(),
            ServicesSection(),
            MenuSection(),
            AboutSection(),
            GallerySection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Mangalam Caterers',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              NavItem('Home'),
              NavItem('Services'),
              NavItem('Menu'),
              NavItem('Gallery'),
              NavItem('Contact'),
            ],
          )
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  const NavItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1551218808-94e220e084d2'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Premium Catering Services',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Weddings | Corporate Events | Parties',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B5E20)),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Book Catering'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionWrapper(
      title: 'Our Services',
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        children: const [
          ServiceCard('Wedding Catering'),
          ServiceCard('Corporate Events'),
          ServiceCard('Birthday Parties'),
          ServiceCard('Canteen Services'),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  const ServiceCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade50,
      ),
      child: Column(
        children: [
          const Icon(Icons.restaurant, size: 50),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionWrapper(
      title: 'Our Menu',
      child: Wrap(
        spacing: 30,
        runSpacing: 20,
        children: const [
          MenuItem('Veg Menu'),
          MenuItem('Snacks'),
          MenuItem('Lunch'),
          MenuItem('Sweets'),
          MenuItem('Dinner'),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  const MenuItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(12),
      label: Text(title),
      backgroundColor: Colors.green.shade100,
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionWrapper(
      title: 'About Us',
      child: const Text(
        'We are a professional catering service provider with years of experience in delivering high-quality food and exceptional service for all occasions.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionWrapper(
      title: 'Gallery',
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: List.generate(
          6,
              (index) => Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1600891964599-f61ba0e24092'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionWrapper(
      title: 'Contact Us',
      child: Column(
        children: const [
          Text('Phone: +91 9876543210'),
          Text('Email: mangalamcaterers@gmail.com'),
          SizedBox(height: 10),
          Text('Location: Delhi NCR'),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      width: double.infinity,
      child: const Text(
        '© 2026 Mangalam Caterers. All Rights Reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

Widget sectionWrapper({required String title, required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
    width: double.infinity,
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        child,
      ],
    ),
  );
}
