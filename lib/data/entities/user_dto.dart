part of 'home_data_dto.dart';

@immutable
class UserDto {
  final String mapboxToken;
  final String whatsappNumber;
  final String smsNumber;
  final String whatsappMessage;
  final String smsMessage;
  final String instructions;

  const UserDto(
    this.mapboxToken,
    this.whatsappNumber,
    this.smsNumber,
    this.whatsappMessage,
    this.smsMessage,
    this.instructions,
  );

  Map<String, dynamic> toMap() {
    return {
      'map_token': mapboxToken,
      'whatsapp_number': whatsappNumber,
      'sms_number': smsNumber,
      'whatsapp_message': whatsappMessage,
      'sms_message': smsMessage,
      'instructions': instructions,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      map['map_token'],
      map['whatsapp_number'],
      map['sms_number'],
      map['whatsapp_message'],
      map['sms_message'],
      map['instructions'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDto(mapboxToken: $mapboxToken, whatsappNumber: $whatsappNumber, smsNumber: $smsNumber, smsMessage: $smsMessage, whatsappMessage: $whatsappMessage, instructions: $instructions)';
  }
}
