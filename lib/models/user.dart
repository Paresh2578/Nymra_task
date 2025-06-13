class User {
  final String id;
  final String username;
  final String fullName;
  final String profileImage;
  final String bio;
  final int followers;
  final int following;
  final int posts;
  final List<String> postImages;

  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.profileImage,
    required this.bio,
    required this.followers,
    required this.following,
    required this.posts,
    required this.postImages,
  });
}

final User currentUser = User(
  id: '1',
  username: 'alex_design',
  fullName: 'Alex Johnson',
  profileImage: 'https://i.pravatar.cc/300?img=3',
  bio:
      'Digital creator | UI/UX Designer | Photography enthusiast\nBased in San Francisco 📍',
  followers: 5482,
  following: 342,
  posts: 127,
  postImages: [
    'https://picsum.photos/200/200?random=1',
    'https://picsum.photos/200/200?random=2',
    'https://picsum.photos/200/200?random=3',
    'https://picsum.photos/200/200?random=4',
    'https://picsum.photos/200/200?random=5',
    'https://picsum.photos/200/200?random=6',
    'https://picsum.photos/200/200?random=7',
    'https://picsum.photos/200/200?random=8',
    'https://picsum.photos/200/200?random=9',
  ],
);
