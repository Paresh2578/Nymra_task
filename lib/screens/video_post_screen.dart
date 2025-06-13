import 'package:flutter/material.dart';
import 'package:demo_check/models/post.dart';
import 'package:demo_check/widgets/video_post_card.dart';

class VideoPostScreen extends StatelessWidget {
  const VideoPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          return VideoPostCard(post: dummyPosts[index]);
        },
      ),
    );
  }
}
