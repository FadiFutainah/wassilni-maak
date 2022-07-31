import 'dart:async';

import 'package:wassilni_maak/data/providers/data_api.dart';
import 'package:wassilni_maak/domain/models/all_data_model.dart';
import 'package:wassilni_maak/domain/models/response_model.dart';

class HomeRepository {
  Future<ResponseModel> getHomeData() async {
    var response = await requestData(DataApi().getHomeData);
    if (!response.hasError) {
      response.data = HomeDataModel.fromDto(response.data);
    }
    return response;
  }

  Future<ResponseModel> getScript() async {
    var response = await requestData(DataApi().getScript);
    if (!response.hasError) {
      response.data = response.data;
    }
    return response;
  }

  Future<ResponseModel> requestData(Function request) async {
    try {
      return ResponseModel(await request(), false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }
}
