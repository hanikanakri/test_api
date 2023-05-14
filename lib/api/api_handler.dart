class ApiHandlerPhoto {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const ApiHandlerPhoto(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory ApiHandlerPhoto.fromJSON(Map<String, dynamic> map) {
    return ApiHandlerPhoto(
        albumId: map['albumId'],
        id: map['id'],
        title: map['title'],
        url: map['url'],
        thumbnailUrl: map['thumbnailUrl']);
  }
}
