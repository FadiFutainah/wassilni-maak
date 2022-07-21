import 'package:wassilni_maak/data/entities/contact_info_dto.dart';
import 'package:wassilni_maak/data/entities/instructions_dto.dart';
import 'package:wassilni_maak/data/entities/vehicle_dto.dart';
import 'package:wassilni_maak/data/services/restapi_service.dart';

class DataApi {
  final RestApiService _restApiService = RestApiService('serverAddress');

  // TODO implement the following
  Future<List<VehicleDto>> getVehicles() async {
    _restApiService.get('endpoint');
    throw UnimplementedError();
  }

  Future<InstructionDto> getInstructions() async {
    throw UnimplementedError();
  }

  Future<ContactInfDto> getContactInfo() async {
    throw UnimplementedError();
  }

  // TODO study the option below
  Future getAllData() async {}
}
