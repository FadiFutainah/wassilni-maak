part of 'home_data_dto.dart';

@immutable
class VehicleDto {
  final int id;
  final String name;
  final String image;
  final int maxPassengers;
  final double minPrice;
  final double kilometerPrice;
  final String instructions;

  const VehicleDto(
    this.id,
    this.name,
    this.image,
    this.maxPassengers,
    this.minPrice,
    this.kilometerPrice,
    this.instructions,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'max_passengers': maxPassengers,
      'min_price': minPrice,
      'kilometer_price': kilometerPrice,
      'instructions': instructions,
    };
  }

  factory VehicleDto.fromMap(Map<String, dynamic> map) {
    return VehicleDto(
      map['id']?.toInt(),
      map['name'],
      map['image'],
      map['max_passengers']?.toInt(),
      map['min_price']?.toDouble(),
      map['kilometer_price']?.toDouble(),
      map['instructions'] ?? 'لا يوجد تعليمات',
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleDto.fromJson(String source) =>
      VehicleDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VehicleDto(id: $id, name: $name, image: $image, maxPassengers: $maxPassengers, minPrice: $minPrice, kilometerPrice: $kilometerPrice, instructions: $instructions)';
  }
}
