import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: Text('Education'),
        backgroundColor: Colors.lightGreen.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCollegeCard(
              assetImage: AssetImage('IITD_Image.png'),
              collegeName: 'Indian Institute of Technology Delhi',
              degree: 'Bachelor of Technology in Electrical Engineering',
              otherInfo: 'Graduated: 2020, CGPA: 8.6/10',
            ),
            SizedBox(height: 40),
            _buildCollegeCard(
              assetImage: AssetImage('INSAL_image.png'), 
              collegeName: 'Institut National des Sciences Appliquées de Lyon', 
              degree: 'Exchange Program in Telecommunication Engineering', 
              otherInfo: 'Autumn Semester 2018'),
          ],
        ),
      ),
    );
  }

  Widget _buildCollegeCard({
    required AssetImage assetImage,
    required String collegeName,
    required String degree,
    required String otherInfo,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 40),
        _buildCollegeImage(assetImage),
        const SizedBox(width: 40),
        _buildCollegeInfo(collegeName, degree, otherInfo),
      ],
    );
  }

  Widget _buildCollegeImage(AssetImage assetImage) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image(
        image: assetImage,
        width: 250,
        height: 250,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildCollegeInfo(String collegeName, String degree, String otherInfo) {
    return Card(
      color: Colors.lightGreen.shade400,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(collegeName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(degree, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(otherInfo, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
