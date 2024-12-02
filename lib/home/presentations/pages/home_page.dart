import 'package:app/home/presentations/pages/chat_room.dart';
import 'package:app/home/presentations/pages/podcast_screen.dart';
import 'package:app/home/presentations/pages/profile.dart';
import 'package:app/home/presentations/pages/therapist.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MainHomePage(), // Main Home Page
    const ChatroomScreen(), // Chatroom Page
    const TherapistsScreen(), // Therapists Page
    const ProfileScreen(), // Profile Page
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Render the currently selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the current selected tab
        onTap: _onTabTapped, // Change the current tab on tap
        selectedItemColor: const Color(0xFF00C853), // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              height: 30,
              width: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/messages.png',
              height: 30,
              width: 30,
            ),
            label: 'Chatroom',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Doctor.png',
              height: 30,
              width: 30,
            ),
            label: 'Therapists',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/profile.png',
              height: 30,
              width: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// Main Home Page
class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mendt',
          style: TextStyle(
            color: Color(0xFF00C853),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/send-2.png',
              height: 30,
              width: 30,
            ),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tips Section
            const Text(
              'Tips you might like',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard('assets/down1.png'),
                  const SizedBox(width: 8),
                  _buildCard('assets/home2.png'),
                  const SizedBox(width: 8),
                  _buildCard('assets/down2.png'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Podcast Section
            const Text(
              'Podcast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to Podcast Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PodcastScreen(),
                            ),
                          );
                        },
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String assetPath) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

final List<String> images = [
  'assets/down1.png',
  'assets/down2.png',
  'assets/down1.png',
  'assets/down2.png',
];

