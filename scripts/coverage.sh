#!/bin/bash
flutter test --coverage
lcov --remove coverage/lcov.info '*.g.dart' '*.part.dart' '*_view.dart' -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html

open coverage/html/index.html


