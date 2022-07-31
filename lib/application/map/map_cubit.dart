import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wassilni_maak/data/providers/global_data.dart';
import 'package:wassilni_maak/domain/models/contact_model.dart';
import 'package:wassilni_maak/domain/models/response_model.dart';
import 'package:wassilni_maak/domain/repositories/data_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  WebViewController? _webController;
  String initialUrl = 'https://www.google.com/maps/';

  ResponseModel? script;

  MapCubit() : super(Loading()) {
    getScript();
  }

  Future<void> getScript() async {
    emit(Loading());

    script = await HomeRepository().getScript();
    if (script!.hasError) {
      emit(Failed(script!.data));
    } else {
      emit(Success());
    }
  }

  void backToChooseDistance() {
    emit(Success());
  }

  void initWebPage(WebViewController controller) {
    _webController = controller;
  }

  void preventPopUp() {
    var noncase = "self.onbeforeunload=null";
    _webController?.runJavascript(noncase);
  }

  bool _validateData() {
    if (vehicles == null) return false;
    if (distance == 0.0) return false;
    if (instructions == '') return false;
    if (contacts == ContactModel.empty()) return false;
    return true;
  }

  Future<void> grabDistance() async {
    var unitDistance =
        await _webController!.runJavascriptReturningResult(script!.data);
    unitDistance = unitDistance.replaceAll("\"", "");
    if (unitDistance == "null") {
      emit(GetDistanceFialed('اختر الرحلة من فضلك'));
    } else {
      if (!_validateData()) {
        emit(GetDistanceFialed('اختر الرحلة من فضلك'));
      } else {
        distance = _getDistance(unitDistance);
        emit(TripChoosed());
      }
    }
  }

  double _getDistance(String unitDistance) {
    var splits = unitDistance.split(' ');
    double distance = double.parse(splits.first);
    if (splits.last != 'km' && splits.last != 'كم') {
      distance /= 1000;
    }
    return distance;
  }

  void websiteFailed(WebResourceError error) {
    emit(Failed(error.description));
  }
}
