import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Color(0xFF00C853),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  for (var user in _messageUsers)
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(user['image']!),
                      ),
                      title: Text(user['name']!),
                      subtitle: Text(user['status']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.black),
                            onPressed: () {
                              // Call functionality
                            },
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.videocam, color: Colors.black),
                            onPressed: () {
                              // Video call functionality
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _messageUsers = [
  {
    'image': 'assets/Frame19.png',
    'name': 'Xena Depp',
    'status': 'Active 2h ago'
  },
  {
    'image': 'assets/Frame90.png',
    'name': 'Gianna Marino',
    'status': 'Active 1h ago'
  },
  {
    'image': 'assets/Frame91.png',
    'name': 'Christian Allister',
    'status': 'Active 8h ago'
  },
  {
    'image': 'assets/Frame92.png',
    'name': 'Vaughn Standly',
    'status': 'Active 4h ago'
  },
  {
    'image': 'assets/Frame93.png',
    'name': 'Jason Depp',
    'status': 'Active 12h ago'
  },
  {
    'image': 'assets/Frame94.png',
    'name': 'Ron Depp',
    'status': 'Active 18h ago'
  },
  {
    'image': 'assets/Frame95.png',
    'name': 'Jessica Depp',
    'status': 'Active 18h ago'
  },
  {
    'image': 'assets/Frame96.png',
    'name': 'Jessica Depp',
    'status': 'Active 18h ago'
  },
  {
    'image': 'assets/Frame97.png',
    'name': 'Jessica Depp',
    'status': 'Active 18h ago'
  },
];
