/// Provides functionality for generating a 6-digit code
/// based on a linear congruential generator algorithm.
class CodeGenerator {
  // Constants for the generator algorithm.
  static final BigInt _multiplier = BigInt.from(0x5DEECE66D);
  static final BigInt _addend = BigInt.from(0xB);
  static final BigInt _mask = BigInt.from(0xFFFFFFFFFFFF);
  static const int _bits = 31;

  /// Generates a pseudo-random 6-digit code based on the [input].
  ///
  /// The algorithm uses a linear congruential generator (LCG)
  /// and outputs a code in the range 000000–999998 (inclusive).
  static int generateCode(int input) {
    final BigInt inputBigInt = BigInt.from(input);
    final BigInt seed = (inputBigInt ^ _multiplier) & _mask;
    final BigInt next = (seed * _multiplier + _addend) & _mask;
    final BigInt intermediate = next >> (48 - _bits);
    final BigInt result = intermediate % BigInt.from(999999);
    return result.toInt();
  }
}
