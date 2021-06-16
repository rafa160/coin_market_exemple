
import 'package:flutter_test/flutter_test.dart';
import 'package:windmill_test_app/helpers/utils.dart';

void main() {
  group('Title name', () {
    test('with null value should be ignored', () {
      final value = splitName(null);
      expect(value, "");
    });

    test('with empty value should be ignored', () {
      final value = splitName("");
      expect(value, "");
    });

    test('with space as value should be ignored', () {
      final value = splitName(" ");
      expect(value, "");
    });

    test('with only one letter should be capitalized', () {
      final value = splitName("m");
      expect(value, "M");
    });

    test('with one word should be capitalized', () {
      final value = splitName("coin");
      expect(value, "Coin");
    });

    test('with one word and one letter should be capitalized', () {
      final value = splitName("Coin l");
      expect(value, "Coin L");
    });

    test('with two words should be capitalized', () {
      final value = splitName("coin list");
      expect(value, "Coin List");
    });

    test('with space at the end', () {
      final value = splitName("coin list  ");
      expect(value, "Coin List");
    });
  });
}