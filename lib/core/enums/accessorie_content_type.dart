import 'package:global_school/core/locale/generated/l10n.dart';

enum ContentType {
  files,
  urls,
  videos,
  images,
  audios,
  documents,
  ar,
}

extension ContentTypeExtension on ContentType {
  String get value {
    return switch (this) {
      ContentType.files => S.current.files,
      ContentType.urls => S.current.urls,
      ContentType.videos => S.current.videos,
      ContentType.images => S.current.images,
      ContentType.audios => S.current.audios,
      ContentType.documents => S.current.documents,
      ContentType.ar => S.current.ar,
    };
  }
}
