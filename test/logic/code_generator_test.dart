import 'package:flutter_test/flutter_test.dart';
import 'package:nt_unlock/logic/code_generator.dart';

void main() {
  final testCases = <int, String>{
    123456: '382410',
    654321: '563771',
    1: '550554',
    999999: '238718',
    0: '742929',
    42: '432692',
    012345: '967027',
    001234: '526016',
  };

  group('CodeGenerator', () {
    test('generates correct 6-digit code for various inputs', () {
      for (final entry in testCases.entries) {
        final input = entry.key;
        final expected = entry.value;

        final result = CodeGenerator.generateCode(input);
        final formatted = result.toString().padLeft(6, '0');

        expect(formatted, equals(expected), reason: 'failed for input: $input');
      }
    });

    test('should always return 6-digit code within range', () {
      for (int i = 0; i < 1000000; i += 50000) {
        final code = CodeGenerator.generateCode(i);
        expect(code, inInclusiveRange(0, 999998));
      }
    });
  });
}
