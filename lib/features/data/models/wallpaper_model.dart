class WallpaperModel {
  final int id;
  final String tinyImage;
  final String largeImage;
  final String photographer;

  WallpaperModel({
    required this.id,
    required this.tinyImage,
    required this.largeImage,
    required this.photographer,
  });
  factory WallpaperModel.fromJson(Map<String, dynamic> json, {isFavourite = false}) {
    return WallpaperModel(
      id: json['id'],
      tinyImage: isFavourite ? json['tinyImage']: json['src']['tiny'],
      largeImage: isFavourite ? json['largeImage']: json['src']['large'],
      photographer: json['photographer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tinyImage': tinyImage,
      'largeImage': largeImage,
      'photographer': photographer,
    };
  }
}
