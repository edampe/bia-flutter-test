import 'package:bia_flutter_test/utils/md5.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  group('MD5', () {
    test('cifrar debe devolver el hash MD5 correcto', () {
      const ts = '123';
      const privateKey = 'myPrivateKey';
      const publicKey = 'myPublicKey';

      final expectedHash =
          md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();

      expect(MD5.encrypt(ts, privateKey, publicKey), equals(expectedHash));
    });

    test('cifrar debe devolver diferentes hashes para diferentes entradas', () {
      const ts1 = '123';
      const privateKey1 = 'myPrivateKey';
      const publicKey1 = 'myPublicKey';

      const ts2 = '456';
      const privateKey2 = 'myPrivateKey2';
      const publicKey2 = 'myPublicKey2';

      final hash1 = MD5.encrypt(ts1, privateKey1, publicKey1);
      final hash2 = MD5.encrypt(ts2, privateKey2, publicKey2);

      expect(hash1, isNot(equals(hash2)));
    });
  });
}
