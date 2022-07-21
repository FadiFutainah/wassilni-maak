import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:wassilni_maak/config/exceptions.dart';
import 'package:wassilni_maak/data/services/rest.dart';
import 'package:http/http.dart' as http;

class RestApiService extends Rest {
  @override
  Future get(String endpoint) async {
    try {
      var uri = Uri.parse(serverAddress + endpoint);
      var response = await http
          .get(
            uri,
            headers: defaultHeaders,
          )
          .timeout(timeoutDuration);
      return returnResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  @override
  Future post(String endpoint, Map<String, dynamic> body) {
    // TODO: implement postRequest
    throw UnimplementedError();
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
