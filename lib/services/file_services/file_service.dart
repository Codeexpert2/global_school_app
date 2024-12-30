import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';

final separator = Platform.pathSeparator;

// final fileServiceProvider = Provider<FileService>(
//   (_) => FileService(),
// );

class FileService {
  FileService();
  // Directory where files will be stored
  late final Directory cacheDir;
  late final Directory supportDir;
  late final Directory documentsDir;
  late final Directory temporaryDir;

  Future<void> init() async {
    cacheDir = await getApplicationCacheDirectory();
    supportDir = await getApplicationSupportDirectory();
    documentsDir = await getApplicationDocumentsDirectory();
    temporaryDir = await getTemporaryDirectory();
  }

  // getters
  String get cachePath => cacheDir.path;
  String get supportPath => supportDir.path;
  String get documentsPath => documentsDir.path;
  String get temporaryPath => temporaryDir.path;

  /// Method to create the directory if it doesn't exist
  Future<void> _ensureDirectoryExists() async {
    final directory = Directory(documentsPath);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }

  String getFilePath(String directoryPath, String fileName) {
    return directoryPath + separator + fileName;
  }

  Future<bool> isFileExist(String directoryPath, String fileName) async {
    Directory directory = Directory(directoryPath);
    if (!await directory.exists()) return false;

    final path = '${directory.path}$separator$fileName';

    File file = File(path);
    return await file.exists();
  }

  /// Method to check if a file exists
  Future<bool> doesFileExist(String fileName) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    return await file.exists();
  }

  /// Method to save data to a file
  Future<void> saveFile(String fileName, String data) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    await file.writeAsString(data);
  }

  /// Method to write data to a file (overwrite existing content)
  Future<void> writeFile(String fileName, String data) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    await file.writeAsString(data);
  }

  /// Method to read data from a file
  Future<String> readFile(String fileName) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    if (await file.exists()) {
      return await file.readAsString();
    } else {
      throw FileSystemException('File not found: $fileName');
    }
  }

  /// Method to delete a file
  Future<void> deleteFile(String path) async {
    try {
      await _ensureDirectoryExists();
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      debugPrint('e: $e');
    }
  }
  // Future<void> deleteFile(String fileName) async {
  //   await _ensureDirectoryExists();
  //   final file = File('$_directoryPath/$fileName');
  //   if (await file.exists()) {
  //     await file.delete();
  //   }
  // }
}




// /// A service class to handle file and directory operations.
// class FileService {
//   /// Creates an instance of [FileService] with a base directory.
//   FileService(this.baseDir);
//   final String baseDir;

//   // Future<void> initialized() async {
//   //   if (baseDir == null) return;
//   //   final dir = await getApplicationDocumentsDirectory();
//   //   baseDir = dir.path;
//   // }

//   /// Saves a file with the given [fileName] and [bytes] in the base directory.
//   ///
//   /// Returns the saved [File] object.
//   ///
//   /// Example usage:
//   /// ```dart
//   /// final file = await fileService.saveFile('example.txt', [104, 101, 111]);
//   /// ```
//   Future<File> saveFile(String fileName, List<int> bytes) async {
//     final file = File('$baseDir$separator$fileName');
//     return file.writeAsBytes(bytes);
//   }

//   /// Saves a file with the given [fileName] and [bytes] in the specified
//   /// [dirName] directory.
//   ///
//   /// Returns the saved [File] object.
//   Future<File> saveFileToDir(
//       String dirName, String fileName, List<int> bytes) async {
//     final dir = Directory('$baseDir$separator$dirName');
//     if (!(await dir.exists())) {
//       await dir.create(recursive: true);
//     }
//     final file = File('${dir.path}$separator$fileName');
//     return file.writeAsBytes(bytes);
//   }

//   /// Retrieves a file with the given [fileName] from the base directory.
//   ///
//   /// Returns the [File] object if it exists, otherwise returns `null`.
//   ///
//   /// Example usage:
//   /// ```dart
//   /// final file = await fileService.getFile('example.txt');
//   /// if (file != null) {
//   ///   // File exists, do something with it
//   /// }
//   /// ```
//   Future<File?> getFile(String fileName) async {
//     final file = File('$baseDir$separator$fileName');
//     if (await file.exists()) return file;
//     return null;
//   }

//   /// Retrieves the full file path for the given [fileName] in the specified
//   /// [dirName] directory.
//   ///
//   /// Returns the [String] path of the file.
//   String getFilePathFromDir(String dirName, String fileName) {
//     return '$baseDir$separator$dirName$separator$fileName';
//   }

//   /// Retrieves a file with the given [fileName] from the specified 
//   /// [dirName] directory.
//   ///
//   /// Returns the [File] object if it exists, otherwise returns `null`.
//   Future<File?> getFileFromDir(String dirName, String fileName) async {
//     final file = File(
//       '$baseDir$separator$dirName$separator$fileName',
//     );
//     if (await file.exists()) return file;
//     return null;
//   }

//   /// Retrieves the full file path for given [fileName] in the base directory.
//   ///
//   /// Returns the [String] path of the file.
//   ///
//   /// Example usage:
//   /// ```dart
//   /// final path = fileService.getFilePath('example.txt');
//   /// print(path); // Outputs the full file path
//   /// ```
//   String getFilePath(String fileName) {
//     return '$baseDir$separator$fileName';
//   }

//   /// Checks if a file with the given [fileName] exists in the base directory.
//   ///
//   /// Returns `true` if the file exists, otherwise returns `false`.
//   ///
//   /// Example usage:
//   /// ```dart
//   /// final exists = await fileService.isFileExist('example.txt');
//   /// if (exists) {
//   ///   // File exists, do something with it
//   /// }
//   /// ```
//   Future<bool> isFileExist(String fileName) async {
//     final file = File('$baseDir$separator$fileName');
//     return file.existsSync();
//   }

//   /// Checks if a file with the given [fileName] exists in the specified
//   /// [dirName] directory.
//   ///
//   /// Returns `true` if the file exists, otherwise returns `false`.
//   Future<bool> isFileExistInDir(String dirName, String fileName) async {
//     final file = File(
//       '$baseDir$separator$dirName$separator$fileName',
//     );
//     return file.existsSync();
//   }

//   /// Checks if the specified [dirName] directory exists.
//   ///
//   /// Returns `true` if the directory exists, otherwise returns `false`.
//   Future<bool> isDirExistInBaseDir(String dirName) async {
//     final dir = Directory('$baseDir$separator$dirName');
//     return dir.existsSync();
//   }

//   /// Checks if the base directory exists.
//   ///
//   /// Returns `true` if the directory exists, otherwise returns `false`.
//   ///
//   /// Example usage:
//   /// ```dart
//   /// final dirExists = await fileService.isDirExist();
//   /// if (dirExists) {
//   ///   // Directory exists, do something with it
//   /// }
//   /// ```
//   Future<bool> isDirExist() async {
//     final dir = Directory(baseDir);
//     return dir.existsSync();
//   }

//   /// Deletes a file with the given [fileName] from the base directory.
//   ///
//   /// Example usage:
//   /// ```dart
//   /// await fileService.deleteFile('example.txt');
//   /// ```
//   Future<void> deleteFile(String fileName) async {
//     final file = File('$baseDir$separator$fileName');
//     if (await file.exists()) await file.delete();
//   }

//   /// Deletes file with [fileName] from the specified [dirName] directory.
//   Future<void> deleteFileFromDir(String dirName, String fileName) async {
//     final file = File(
//       '$baseDir$separator$dirName$separator$fileName',
//     );
//     if (await file.exists()) await file.delete();
//   }

//   Future<File> byteToFile(Uint8List bytes, String fileName) async {
//     File file = await File('$baseDir/$fileName.pdf').create();
//     return file.writeAsBytes(bytes);
//   }
// }
