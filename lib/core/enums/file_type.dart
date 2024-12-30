enum FileType {
  unknown,
  pdf,
  audio,
  image;

  /// get file type from name .pdf .mp3 ...
  static FileType getFileType(String fileName) {
    String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
    switch (extension.toLowerCase()) {
      case 'pdf':
        return pdf;
      case 'mp3':
        return audio;
      case 'jpg':
      case 'png':
      case 'gif':
        return image;
      default:
        return unknown;
    }
  }
}
