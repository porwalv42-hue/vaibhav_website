import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "dart:convert";

import "package:vaibhav_website/utils.dart";

class AwardScreen extends StatelessWidget {
  const AwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text('Awards & Honors'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, String>>>(
          future: loadDataFromJson('assets/awards.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return _buildAward(snapshot.data!);
            } else {
              return Text('No awards found');
            }
          },
          initialData: [{'title': 'Loading...', 'issuer': '', 'description': '', 'date': ''}],
        ),
      ),
    );
  }

  Widget _buildAward(List<Map<String, String>> awards) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: awards.length,
      itemBuilder: (context, index) {
        return _buildAwardCard(awards[index]);
      },
    );
  }

  Widget _buildAwardCard(Map awardDetails) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.deepPurple.shade200,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              awardDetails['title'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'For ${awardDetails['date']}',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(
              awardDetails['issuer'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              awardDetails['description'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

