import 'package:wassilni_maak/data/entities/home_data_dto.dart';
import 'package:wassilni_maak/domain/models/contact_model.dart';
import 'package:wassilni_maak/domain/models/vehicle_model.dart';

class HomeDataModel {
  List<VehicleModel> vehicles;
  String instructions;
  ContactModel contacts;

  HomeDataModel({
    required this.vehicles,
    required this.instructions,
    required this.contacts,
  });

  factory HomeDataModel.fromDto(HomeDataDto dto) => HomeDataModel(
        vehicles: dto.vehicles.map((e) => VehicleModel.fromDto(e)).toList(),
        instructions: dto.users[0].instructions,
        contacts: ContactModel.fromDto(dto.users[0]),
      );

  factory HomeDataModel.mockdata() => HomeDataModel(
        vehicles: VehicleModel.mockdatList(),
        instructions: 'Instructions...',
        contacts: ContactModel.mockdata(),
      );
}
