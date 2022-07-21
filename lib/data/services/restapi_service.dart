import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:wassilni_maak/config/exceptions.dart';
import 'package:wassilni_maak/data/services/rest.dart';
import 'package:http/http.dart' as http;

class RestApiService extends Rest {
  RestApiService(super.serverAddress);

  @override
  Future get(
    String endpoint, {
    Map<String, String> headers = Rest.defaultHeaders,
  }) async {
    try {
      var uri = Uri.parse(serverAddress + endpoint);
      var response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(timeoutDuration);
      return returnResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 404:
        throw NotFoundException(response.statusCode);
      case 500:
        throw FetchDataException(response.statusCode);
      default:
        throw InternetConnectionException();
    }
  }
}
