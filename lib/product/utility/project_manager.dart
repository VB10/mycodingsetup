import 'package:flutter/material.dart';

@immutable
final class ProjectManager {
  const ProjectManager._();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
