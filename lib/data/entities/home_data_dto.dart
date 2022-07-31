import 'dart:convert';

import 'package:flutter/foundation.dart';

part 'user_dto.dart';
part 'vehicle_dto.dart';

@immutable
class HomeDataDto {
  final List<UserDto> users;
  final List<VehicleDto> vehicles;

  const HomeDataDto(
    this.users,
    this.vehicles,
  );

  Map<String, dynamic> toMap() {
    return {
      'vehiclesInfo': vehicles.map((x) => x.toMap()).toList(),
      'userInfo': users.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeDataDto.fromMap(Map<String, dynamic> map) {
    return HomeDataDto(
      [UserDto.fromMap(map['userInfo'][0])],
      List<VehicleDto>.from(
          map['vehiclesInfo'].map((e) => VehicleDto.fromMap(e)).toList()),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDataDto.fromJson(String source) =>
      HomeDataDto.fromMap(json.decode(source));

  @override
  String toString() => 'HomeDataDto(vehicles: $vehicles, users: $users)';
}
