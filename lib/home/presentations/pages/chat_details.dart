import 'package:flutter/material.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Relationships',
            style: TextStyle(
              color: Colors.green,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                        'assets/Frame19.png'), // Replace with actual image
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "I just broke up with my boyfriend and I left some of my best clothes at his house would it be weird if I go to collect them back",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Like",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              icon: const Icon(Icons.comment_outlined),
                              onPressed: () {},
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Comment",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              icon: const Icon(Icons.share_outlined),
                              onPressed: () {},
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            // Comments Input
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Leave a comment",
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.green),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            // Comments Section
            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: CommentTile(
                      username: 'Stiles Stilinsky',
                      comment: 'If you love it, go get it',
                    ),
                  ),
                  const Divider(thickness: 1),
                  Card(
                    child: CommentTile(
                      username: 'Stiles Stilinsky',
                      comment: 'If you love it, go get it',
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

class CommentTile extends StatelessWidget {
  final String username;
  final String comment;

  const CommentTile({
    Key? key,
    required this.username,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage:
                AssetImage('assets/Frame90.png'), // Replace with actual image
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
