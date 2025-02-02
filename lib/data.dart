class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'JayM',
  profileImageUrl:
      'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Furniture App Concept | Figma Template',
    thumbnailUrl: 'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
    duration: '17:20',
    timestamp: DateTime(2022, 3, 20),
    viewCount: '40K',
    likes: '2958',
    dislikes: '24',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title: 'Flutter Google Maps API Tutorial | Web and Mobile',
    thumbnailUrl: 'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Adding Firebase with Flutterfire CLI in Flutter',
    thumbnailUrl: 'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
    duration: '10:53',
    timestamp: DateTime(2022, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title:'Portfolio Design | Flutter Tutorial',
    thumbnailUrl: 'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
    duration: '15:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Comparison between Flutter vs React-Native',
    thumbnailUrl: 'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
    duration: '10:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '19K',
    likes: '2.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Diet Tracker UI Tutorial | App From Scratch',
    thumbnailUrl: 'https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&w=600',
    duration: '43:58',
    timestamp: DateTime(2022, 10, 17),
    viewCount: '158K',
    likes: '20k',
    dislikes: '85',
  ),
];
