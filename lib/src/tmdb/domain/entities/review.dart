class Review {
  final String id;
  final String name;
  final String username;
  final String? avatarPath;
  final double? raiting;
  final String content;
  final DateTime? lastUpdated;

  Review({
    required this.id,
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.raiting,
    required this.content,
    required this.lastUpdated,
  });
}
