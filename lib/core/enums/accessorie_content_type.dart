// content_type.dart
enum ContentType {
  files,
  urls,
  videos,
  images,
}

extension ContentTypeExtension on ContentType {
  String get value {
    switch (this) {
      case ContentType.files:
        return 'files';
      case ContentType.urls:
        return 'urls';
      case ContentType.videos:
        return 'videos';
      case ContentType.images:
        return 'images';
    }
  }
}