import 'package:app/home/presentations/pages/chat_details.dart';
import 'package:flutter/material.dart';

class ChatroomScreen extends StatelessWidget {
  const ChatroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Chatroom',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'Chatroom Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              title: 'Home',
              onTap: () {},
            ),
            _buildDrawerItem(
              context,
              icon: Icons.chat,
              title: 'Chatroom',
              onTap: () {},
            ),
            _buildDrawerItem(
              context,
              icon: Icons.person,
              title: 'Therapists',
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  //filled: true,
                  //fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child:
                        _buildCategoryButton(context, 'Relationships', false),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCategoryButton(context, 'Career', true),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildCategoryButton(context, 'Education', true),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCategoryButton(context, 'Other', false),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Hot Topics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildHotTopic(
                'Should you collect back your items from your ex when you break up',
              ),
              _buildHotTopic(
                'Should you collect back your items from your ex when you break up',
              ),
              _buildHotTopic(
                'Should you collect back your items from your ex when you break up',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatDetails()),
        );
      },
      child: Container(
        width: 161,
        height: 96,
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildHotTopic(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: onTap,
    );
  }
}
