import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ImageHelper {
  static ImageProvider cashedImageProvider(String imageUrl) {
    return CachedNetworkImageProvider(imageUrl);

    // if (isImageUrl(imageUrl)) {
    //   // Load image
    //   return CachedNetworkImageProvider(imageUrl);
    // } else {
    //   // Handle error: Not a valid image URL
    //   return const AssetImage('');
    // }
  }

  static bool isImageUrl(String url) {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];
    final uri = Uri.parse(url);
    final path = uri.path.toLowerCase();
    final extension = path.split('.').last;

    return imageExtensions.contains(extension);
  }
}

/* 
    TODO need to test
    https://stackoverflow.com/a/77236647/16260508
    
    SafeCachedNetworkImageProvider(
      'https://someurl.com/image.jpg',
      fallbackImage: AssetImage('assets/images/placeholder.png'),
    );
*/
class SafeCachedNetworkImageProvider extends CachedNetworkImageProvider {

  const SafeCachedNetworkImageProvider(
    super.url, {
    this.fallbackImage,
  });
  final ImageProvider? fallbackImage;

  @override
  ImageStreamCompleter loadImage(
    CachedNetworkImageProvider key,
    ImageDecoderCallback decode,
  ) {
    try {
      return super.loadImage(key, decode);
    } catch (e) {
      if (fallbackImage != null) {
        return fallbackImage!.loadImage(fallbackImage!, decode);
      }
      // Emit an error through the ImageStream
      final errorCompleter = ErrorImageStreamCompleter();
      errorCompleter.setError(e, StackTrace.current);
      return errorCompleter;
    }
  }
}

class ErrorImageStreamCompleter extends ImageStreamCompleter {
  void setError(Object error, StackTrace stackTrace) {
    reportError(
      context: ErrorDescription('Error in ImageStreamCompleter'),
      exception: error,
      stack: stackTrace,
    );
  }
}
