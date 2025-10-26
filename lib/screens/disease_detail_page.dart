import 'package:flutter/material.dart';
import '../models/disease_category.dart';
import '../widgets/disease_card.dart';
import '../constants/app_colors.dart';

class DiseaseDetailPage extends StatelessWidget {
  final DiseaseCategory category;

  const DiseaseDetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.cardBorder,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
        ),
        title: Text(
          '${category.id}. ${category.title}',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.textPrimary),
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
          children: category.diseases.map((disease) {
            return DiseaseCard(
              title: disease,
              onTap: () {
                // Handle specific disease selection
                print('Selected Disease: $disease');
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}