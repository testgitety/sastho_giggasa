import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'রোগের নিরাপন নির্বাচন ক্ৰম',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const RecommendationPage(),
    );
  }
}

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _showDiseaseDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DiseaseDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004D40),
      body: SafeArea(
        child: Column(
          children: [
            // Header with close button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'রোগের বিভেগ নির্বাচন ক্ৰম',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            // Image Gallery/Slider
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF003D33),
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
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/health1.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildGallerySlide(
                              '🏥',
                              'স্বাস্থ্য পরীক্ষা সেবা',
                              Colors.blue[700]!,
                            );
                          },
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/health2.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildGallerySlide(
                              '💊',
                              'ওষুধ ও চিকিৎসা পরামর্শ',
                              Colors.red[700]!,
                            );
                          },
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/health3.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildGallerySlide(
                              '🩺',
                              'ডাক্তার পরামর্শ সেবা',
                              Colors.green[700]!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 12,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                            (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.amber
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Grid of recommendation options
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.95,
                  children: [
                    _buildOptionCard(
                      icon: '🌼',
                      title: 'A. সংক্রমণজনিত রোগ',
                      onTap: () => _showDiseaseDetail(context),
                    ),
                    _buildOptionCard(
                      icon: '🍴',
                      title: 'B. খাবর ও পুষ্টির সমস্যা',
                    ),
                    _buildOptionCard(
                      icon: '💚',
                      title: 'C. লাসাতন ও ইতলরগ',
                    ),
                    _buildOptionCard(
                      icon: '🧠',
                      title: 'D. মানুষ প্রদিনতিক রোগ',
                    ),
                    _buildOptionCard(
                      icon: '🩺',
                      title: 'E. নেখা, কান, নাত ও গোল',
                    ),
                    _buildOptionCard(
                      icon: '⭐',
                      title: 'F. চাৰ্মরোগ ও আলালরিক',
                    ),
                    _buildOptionCard(
                      icon: '🧪',
                      title: 'G. হাৰাগত ও নির্ণাশীতি সমস্যা',
                    ),
                    _buildOptionCard(
                      icon: '⭕',
                      title: 'H. নাত্রী ও প্ৰজনন ব্যাবা',
                    ),
                    _buildOptionCard(
                      icon: '♂️',
                      title: 'I. পুরুষ ব্যাবা',
                    ),
                    _buildOptionCard(
                      icon: '🦴',
                      title: 'J. বিড়ার ও যুক্তবন',
                    ),
                    _buildOptionCard(
                      icon: '🦴',
                      title: 'K. হাড়, নাসপেশি ও তন্তু',
                    ),
                    _buildOptionCard(
                      icon: '👶',
                      title: 'L. শিশুদের সবাবাম রোগ',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({required String icon, required String title, VoidCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF003D33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.teal.shade700,
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ?? () {
            // Handle navigation
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected: $title'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  icon,
                  style: const TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiseaseDetailPage extends StatelessWidget {
  const DiseaseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004D40),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D5D52),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
        ),
        title: const Text(
          'A. সংক্রমণজনিত রোগ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.85,
          children: [
            _buildDiseaseCard('সর্দি-কাশি\n(Common\nCold)'),
            _buildDiseaseCard('ফ্লু (Fever)'),
            _buildDiseaseCard('ইনফ্লুয়েঞ্জা (Flu)'),
            _buildDiseaseCard('টাইফয়েড (Typhoid\nFever)'),
            _buildDiseaseCard('নিউমোনিয়া\n(Pneumonia)'),
            _buildDiseaseCard('জন্ডিস\n(Jaundice)'),
            _buildDiseaseCard('হাম (Measles)'),
            _buildDiseaseCard('পোলিও (Diarrhea)'),
            _buildDiseaseCard('আমাশয়\n(Dysentery)'),
            _buildDiseaseCard('যক্ষ্মা / টিবি\n(Tuberculosis)'),
            _buildDiseaseCard('ম্যালেরিয়া (Malaria)'),
            _buildDiseaseCard('ডেঙ্গু জ্বর (Dengue\nFever)'),
            _buildDiseaseCard('চিকুনগুনিয়া\n(Chikungunya)'),
            _buildDiseaseCard('কলেরা, A.B.C\n(Hepatitis)'),
            _buildDiseaseCard('খুব জ্বর\n(Mumps)'),
            _buildDiseaseCard('করোনা-১৯ (COVID-\n19)'),
            _buildDiseaseCard('হুপিং\nকফ (Whooping\nCough)'),
            _buildDiseaseCard('হাম (Measles)'),
            _buildDiseaseCard('রুবেলা (Rubella)'),
            _buildDiseaseCard('টিটেনাস\n(Chickenpox)'),
            _buildDiseaseCard('মেনিনজাইটিস\n(Meningitis)'),
          ],
        ),
      ),
    );
  }

  Widget _buildDiseaseCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF003D33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF0D5D52),
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle disease selection
          },
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreventionItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF003D33),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.teal.shade700,
                width: 2,
              ),
            ),
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}