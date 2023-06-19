import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMarvelPublicKey =
      dotenv.env['THE_PUBLIC_KEY'] ?? 'No hay public key';
  static String theMarvelPrivateKey =
      dotenv.env['THE_PRIVATE_KEY'] ?? 'No hay api key';
  static String theMarvelHash = dotenv.env['HASH'] ?? 'No hay hash';
}
