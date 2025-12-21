import 'package:flutter/material.dart';
import 'package:vaibhav_website/award.dart';
import 'app_strings.dart' as appStrings;
import 'package:flutter_svg/flutter_svg.dart';
import 'education.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,

        appBar: AppBar(
          title: const Text(appStrings.welcomeTitle),
          backgroundColor: Colors.deepPurple.shade200,
          ),

        body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex : 1),
                  _buildProfileSection(),
                  Spacer(flex : 1),
                  _buildButtonSection(context),
                  Spacer(flex : 1),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        _buildProfileImage(),
        const Spacer(flex: 1),
        _buildProfileInfo(),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: const Image(
      image: AssetImage('Vaibhav_Porwal.jpg'),
      width: 250,
      height: 250,
      fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Text(
          appStrings.name,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade400,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          appStrings.aboutMessage,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          maxLines: 6,
        ),
      ],
    );
  }

  Widget _nextSectionWidget(String imageAsset, void Function() onPressWidget) {
    return ElevatedButton(
          onPressed: onPressWidget,
          clipBehavior: Clip.hardEdge,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.deepPurple.shade400,
            foregroundColor: Colors.black,
          ),
          child: SvgPicture.asset(imageAsset, width: 120, height: 120), //const Text('View Portfolio'),
        );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1,),

        _nextSectionWidget('education.svg', () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => EducationScreen()),
          );
        }),

        Spacer(flex: 1,),

        _nextSectionWidget('work.svg', () {}),

        Spacer(flex: 1,),
        
        _nextSectionWidget('trophy.svg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AwardScreen()));
        }),

        Spacer(flex: 1,),

        _nextSectionWidget('patent.svg', () {}),

        Spacer(flex: 1,),
      ],
    );
  }
}
