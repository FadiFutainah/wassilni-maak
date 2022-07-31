import 'package:wassilni_maak/config/exceptions.dart';
import 'package:wassilni_maak/data/entities/home_data_dto.dart';
import 'package:wassilni_maak/data/services/restapi_service.dart';

class DataApi {
  final RestApiService _restApiService =
      RestApiService('https://wasslnimaak.000webhostapp.com/');

  Future<HomeDataDto> getHomeData() async {
    try {
      var response = await _restApiService.get('api/get_all_data');

      if (response['stauts'] != 200) {
        throw AppException(response['message']);
      }

      return HomeDataDto.fromMap(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getScript() async {
    try {
      var response = await _restApiService.get('api/get_script');

      if (response['status'] != 200) {
        throw AppException(response['message']);
      }

      return response['data'][0];
    } catch (e) {
      rethrow;
    }
  }
}
