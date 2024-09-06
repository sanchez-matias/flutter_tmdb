enum ContentType {movie, tv, person}

class GenericSlide {
  final ContentType contentType;
  final int id;
  final String imageUrl;
  final String title;
  final double? score;

  GenericSlide({
    required this.contentType,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.score,
  });

  String get route {
    switch (contentType) {
      case ContentType.movie:
        return 'movie/$id';
      case ContentType.tv:
        return 'tv/$id';
      case ContentType.person:
        return 'person/$id';
    }
  }
}
