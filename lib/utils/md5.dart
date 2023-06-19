import 'package:crypto/crypto.dart';
import 'dart:convert';

class MD5 {
  /// Encrypts the Marvel Api public and private keys with an addition ts key, with MD5 algorithm
  static String encrypt(String ts, String privateKey, String publicKey) {
    final data = utf8.encode(ts + privateKey + publicKey);
    final hash = md5.convert(data);
    return hash.toString();
  }
}
