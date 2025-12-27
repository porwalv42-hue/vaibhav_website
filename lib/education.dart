import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.deepPurple.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1,),
              _buildCollegeCard(
                assetImage: AssetImage('IITD_Image.png'),
                collegeName: 'Indian Institute of Technology Delhi',
                degree: 'Bachelor of Technology in Electrical Engineering',
                otherInfo: 'Graduated: 2020, CGPA: 8.6/10',
              ),
              Spacer(flex: 1,),
              _buildCollegeCard(
                assetImage: AssetImage('INSAL_image.png'), 
                collegeName: 'Institut National des Sciences Appliquées de Lyon', 
                degree: 'Exchange Program in Telecommunication Engineering', 
                otherInfo: 'Autumn Semester 2018'),
              Spacer(flex: 1,),
            ],
          ),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.deepPurple.shade200
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCollegeImage(assetImage),
          SizedBox(height: 16),
          _buildCollegeInfo(collegeName, degree, otherInfo),
        ],
      ),
    );
  }

  Widget _buildCollegeImage(AssetImage assetImage) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image(
        image: assetImage,
        width: 250,
        height: 250,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildCollegeInfo(String collegeName, String degree, String otherInfo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(collegeName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(degree, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Text(otherInfo, style: const TextStyle(fontSize: 16)),          ],
      ),
    );
  }
}
