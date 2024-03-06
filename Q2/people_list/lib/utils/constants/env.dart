import 'package:flutter_dotenv/flutter_dotenv.dart';

class Envs {
  Envs._();

  static final String connectTimeout = dotenv.env['CONNECT_TIMEOUT'] ?? '';
  static final String receiveTimeout = dotenv.env['RECEIVE_TIMEOUT'] ?? '';

  static final String apiBaseUrl = dotenv.env['API_BASE_URL'] ?? '';
  static String apiGetListToken = dotenv.env['API_GET_LIST_TOKEN'] ?? '';
}
