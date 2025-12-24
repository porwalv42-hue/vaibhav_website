import 'package:flutter/material.dart';
import 'package:vaibhav_website/utils.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime.shade100,
      appBar: AppBar(
        title: const Text('Professional Experience'),
        backgroundColor: Colors.lime.shade200,
      ),
      body: FutureBuilder<List>(
        future: loadDataFromJsonExperience('assets/experience.json'),
        builder: (context, snapshot) => _buildBody(snapshot),
      ),
    );
  }

  Widget _buildBody(AsyncSnapshot<List> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    if (snapshot.hasData) {
      return _buildExperienceList(snapshot.data!);
    }
    return const Center(child: Text('No experiences found'));
  }

  Widget _buildExperienceList(List experiences) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: experiences.length,
      itemBuilder: (context, index) => _buildExperienceCard(experiences[index]),
    );
  }

  Widget _buildExperienceCard(Map experience) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.lime.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExperienceBrief(experience),
            const SizedBox(width: 20),
            Expanded(
              child: _buildResponsibilities(experience['responsibilities']),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceBrief(Map experience) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience['title'],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          experience['company'],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          experience['duration'],
          style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Text(
          experience['location'],
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildResponsibilities(List responsibilities) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: responsibilities
            .map((resp) => _buildResponsibilityItem(resp))
            .toList(),
      ),
    );
  }

  Widget _buildResponsibilityItem(String responsibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              responsibility,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}