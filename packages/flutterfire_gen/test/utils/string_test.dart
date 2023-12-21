import 'package:flutterfire_gen/src/utils/string.dart';
import 'package:test/test.dart';

void main() {
  test('capitalize string', () {
    const input = 'sampleValue';
    expect(input.capitalize(), 'SampleValue');
  });

  test('decapitalize string', () {
    const input = 'SampleValue';
    expect(input.decapitalize(), 'sampleValue');
  });
}
