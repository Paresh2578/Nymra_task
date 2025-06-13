class Post {
  final String id;
  final String username;
  final String userAvatar;
  final String videoThumbnail;
  final String videoUrl;
  final String caption;
  final int likes;
  final int comments;
  final bool isLiked;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.videoThumbnail,
    required this.videoUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.timestamp,
  });
}

List<Post> dummyPosts = [
  Post(
    id: '1',
    username: 'johndoe',
    userAvatar: 'https://i.pravatar.cc/150?img=1',
    videoThumbnail: 'https://picsum.photos/400/600?random=1',
    videoUrl: 'dummy_url',
    caption: 'Exploring the beautiful mountains! #adventure #travel',
    likes: 1243,
    comments: 89,
    isLiked: false,
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Post(
    id: '2',
    username: 'janedoe',
    userAvatar: 'https://i.pravatar.cc/150?img=5',
    videoThumbnail: 'https://picsum.photos/400/600?random=2',
    videoUrl: 'dummy_url',
    caption: 'Cooking my favorite pasta recipe! #food #cooking #homemade',
    likes: 2567,
    comments: 134,
    isLiked: true,
    timestamp: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  Post(
    id: '3',
    username: 'techguy',
    userAvatar: 'https://i.pravatar.cc/150?img=8',
    videoThumbnail: 'https://picsum.photos/400/600?random=3',
    videoUrl: 'dummy_url',
    caption: 'Check out this new gadget I got! #tech #review #newgadget',
    likes: 876,
    comments: 45,
    isLiked: false,
    timestamp: DateTime.now().subtract(const Duration(hours: 8)),
  ),
];
