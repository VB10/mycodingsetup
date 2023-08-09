// ignore_for_file: prefer_constructors_over_static_methods

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@immutable
final class FileOperation {
  const FileOperation._();
  static FileOperation? _operation;
  static FileOperation get instance {
    _operation ??= const FileOperation._();
    return _operation!;
  }

  Future<Directory> _fileDirectory(String path) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;

    final dirPath = p.join(appDocPath, path);
    final newDirectory = Directory(dirPath);
    return newDirectory;
  }

  /// The function creates a subdirectory at the specified path if it doesn't already exist and returns the path of the new
  /// directory.
  ///
  /// Args:
  ///   path (String): The `path` parameter is a string that represents the path to the directory that you want to create a
  /// subdirectory in.
  ///
  /// Returns:
  ///   The method is returning a `Future<String>`.
  Future<String> createSubDirectory(String path) async {
    try {
      final newDirectory = await _fileDirectory(path);

      if (!await newDirectory.exists()) {
        await newDirectory.create();
      }
      return newDirectory.path;
    } catch (e) {
      throw Exception(e);
    }
  }

  /// The function `removeSubDirectory` removes a subdirectory at the specified path and returns a boolean indicating whether
  /// the operation was successful.
  ///
  /// Args:
  ///   path (String): The `path` parameter is a string that represents the directory path of the subdirectory that you want
  /// to remove.
  ///
  /// Returns:
  ///   a `Future<bool>`.
  Future<bool> removeSubDirectory(String path) async {
    try {
      final newDirectory = await _fileDirectory(path);

      if (await newDirectory.exists()) {
        await newDirectory.delete();
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
