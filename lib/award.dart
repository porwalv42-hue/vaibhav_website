import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "dart:convert";

class AwardScreen extends StatelessWidget {
  const AwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: Text('Awards & Honors'),
        backgroundColor: Colors.amber.shade200,
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, String>>>(
          future: _loadAwardsFromJson(),
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

  Future<List<Map<String, String>>> _loadAwardsFromJson() async {
    final jsonString = await rootBundle.loadString('assets/awards.json');
    final List<dynamic> jsonData = json.decode(jsonString)['awards'];
    print('Loaded awards data: $jsonData');
    return jsonData.map((item) => Map<String, String>.from(item as Map)).toList();
  }

  Widget _buildAwardCard(Map awardDetails) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.amber.shade300,
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

