import 'dart:io';

abstract interface class CloudStorageService {
  /// Upload a file to cloud storage.
  Future store(File file, {void Function(double progress)? onProgress});

  /// Get / download a file from cloud storage.
  Future<File> getFile(dynamic identifier);

  /// Delete a file from cloud storage.
  Future trashFile(dynamic identifier, {bool permanent = false});

  /// Restore a deleted file.
  Future restoreFile(dynamic identifier);

  /// Parse a file url from an identifier.
  String getFileUrl(dynamic identifier);
}
