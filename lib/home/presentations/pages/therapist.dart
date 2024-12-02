import 'package:flutter/material.dart';

class TherapistsScreen extends StatelessWidget {
  const TherapistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Therapists',
          style: TextStyle(
            color: Color(0xFF00C853),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // Therapist 1
                  _buildTherapistCard(
                    imagePath: 'assets/tel1.png',
                    name: 'Kora Okafor',
                    role: 'Clinical psychologist',
                  ),
                  const SizedBox(height: 16),

                  // Therapist 2
                  _buildTherapistCard(
                    imagePath: 'assets/tel2.png',
                    name: 'Kora Okafor',
                    role: 'Clinical psychologist',
                  ),
                  const SizedBox(height: 16),

                  // Therapist 3
                  _buildTherapistCard(
                    imagePath: 'assets/tel3.png',
                    name: 'Kora Okafor',
                    role: 'Clinical psychologist',
                  ),
                  const SizedBox(height: 16),

                  // Therapist 4
                  _buildTherapistCard(
                    imagePath: 'assets/tel4.png',
                    name: 'Kora Okafor',
                    role: 'Clinical psychologist',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a therapist card
  Widget _buildTherapistCard({
    required String imagePath,
    required String name,
    required String role,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Therapist image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Therapist name and role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // Star rating
          Row(
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star_border,
                color: Colors.amber,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
