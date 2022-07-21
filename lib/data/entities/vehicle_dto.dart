import 'dart:convert';

class VehicleDto {
  String name;
  String image;
  String maxPassengers;
  double minPrice;
  double kilometerPrice;

  VehicleDto(
    this.name,
    this.image,
    this.maxPassengers,
    this.minPrice,
    this.kilometerPrice,
  );

  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
        'max_passengers': maxPassengers,
        'min_price': minPrice,
        'kilometer_price': kilometerPrice,
      };

  factory VehicleDto.fromMap(Map<String, dynamic> map) => VehicleDto(
        map['name'],
        map['image'],
        map['max_passengers'],
        map['min_price']?.toDouble(),
        map['kilometer_price']?.toDouble(),
      );

  String toJson() => json.encode(toMap());

  factory VehicleDto.fromJson(String source) =>
      VehicleDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VehicleDto(name: $name, image: $image, maxPassengers: $maxPassengers, minPrice: $minPrice, kilometerPrice: $kilometerPrice)';
  }
}
