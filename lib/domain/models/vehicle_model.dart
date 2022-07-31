import 'package:wassilni_maak/data/entities/home_data_dto.dart';

class VehicleModel {
  static const String _imagesPath =
      'https://wasslnimaak.000webhostapp.com/images/vehicles/';

  int id;
  String name;
  String image;
  int maxPassengers;
  double minPrice;
  double kilometerPrice;
  String instructions;

  VehicleModel({
    required this.id,
    required this.name,
    required this.image,
    required this.maxPassengers,
    required this.minPrice,
    required this.kilometerPrice,
    required this.instructions,
  });

  factory VehicleModel.fromDto(VehicleDto dto) => VehicleModel(
        id: dto.id,
        name: dto.name,
        image: _imagesPath + dto.image,
        maxPassengers: dto.maxPassengers,
        minPrice: dto.minPrice,
        kilometerPrice: dto.kilometerPrice,
        instructions: dto.instructions,
      );

  factory VehicleModel.mockdata() => VehicleModel(
        id: 1,
        name: 'باص',
        image: 'assets/icons/bus.png',
        maxPassengers: 13,
        minPrice: 2000,
        kilometerPrice: 1500,
        instructions: 'التعليمات',
      );

  factory VehicleModel.mockdata1() => VehicleModel(
        id: 1,
        name: 'تاكسي',
        image: 'assets/icons/taxi.png',
        maxPassengers: 7,
        minPrice: 2000,
        kilometerPrice: 1500,
        instructions: 'التعليمات',
      );

  factory VehicleModel.mockdata11() => VehicleModel(
        id: 1,
        name: 'فان',
        image: 'assets/icons/van.jpg',
        maxPassengers: 11,
        minPrice: 2000,
        kilometerPrice: 1500,
        instructions: 'التعليمات',
      );

  static List<VehicleModel> mockdatList() {
    return [
      VehicleModel.mockdata(),
      VehicleModel.mockdata1(),
      VehicleModel.mockdata11(),
      VehicleModel.mockdata(),
      VehicleModel.mockdata1(),
      VehicleModel.mockdata11(),
      VehicleModel.mockdata(),
      VehicleModel.mockdata(),
    ];
  }

  int calculatePrice(double distance) {
    int price = (kilometerPrice * distance).round();
    return (price >= minPrice) ? price : minPrice.round();
  }
}
