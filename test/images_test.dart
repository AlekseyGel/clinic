import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.foo).existsSync(), isTrue);
    expect(File(Images.one).existsSync(), isTrue);
    expect(File(Images.tree).existsSync(), isTrue);
    expect(File(Images.two).existsSync(), isTrue);
  });
}
