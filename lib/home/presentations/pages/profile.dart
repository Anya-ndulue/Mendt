import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF00C853), // Green color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/setting.png', height: 30, width: 30),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Profile Image
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/profil.png'), // Replace with actual image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Name
            const Text(
              'Lucy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Mood Question
            const Text(
              'How do you feel today?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            // Mood Icons
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MoodIcon('assets/Grinning.png', 'Happy'),
                _MoodIcon('assets/Frame.png', 'Stressed'),
                _MoodIcon('assets/ConfoundedFace.png', 'Worried'),
                _MoodIcon('assets/WoozyFace.png', 'Confused'),
                _MoodIcon('assets/PensiveFace.png', 'Sad'),
              ],
            ),
            const SizedBox(height: 32),
            // Diary Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DiaryCard(
                  icon: Image.asset('assets/microphone.png',
                      height: 70, width: 70), // Updated icon
                  label: 'Audio',
                  onTap: () {
                    // Handle Audio action
                  },
                ),
                _DiaryCard(
                  icon: Image.asset('assets/book.png',
                      height: 70, width: 70), // Updated icon
                  label: 'Note',
                  onTap: () {
                    // Handle Note action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Mood Icon Widget
class _MoodIcon extends StatelessWidget {
  final String iconPath;
  final String label;

  const _MoodIcon(this.iconPath, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconPath,
          height: 40,
          width: 40,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// Diary Card Widget
class _DiaryCard extends StatelessWidget {
  final Widget
      icon; // Changed from IconData to Widget to support both Icon and Image
  final String label;
  final VoidCallback onTap;

  const _DiaryCard({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,

            child: Center(child: icon), // Center the icon
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
