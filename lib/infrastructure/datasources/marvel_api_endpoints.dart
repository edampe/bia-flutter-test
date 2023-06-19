import 'package:bia_flutter_test/config/constants/environment.dart';
import 'package:bia_flutter_test/utils/md5.dart';

import 'package:dio/dio.dart';

class BaseApiService {
  static Dio basePetition() {
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = MD5.encrypt(timeStamp, Environment.theMarvelPrivateKey,
        Environment.theMarvelPublicKey);

    return Dio(BaseOptions(
        baseUrl: 'https://gateway.marvel.com:443/v1/public',
        queryParameters: {
          'ts': timeStamp,
          'apikey': Environment.theMarvelPublicKey,
          'hash': hash,
        }));
  }
}
