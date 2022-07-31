import 'package:wassilni_maak/data/entities/home_data_dto.dart';

enum ContactApp {
  whatsapp,
  sms,
}

class ContactModel {
  String whatsappMessage;
  String smsMessage;
  String whatsappNumber;
  String smsNumber;

  ContactModel({
    required this.whatsappMessage,
    required this.smsMessage,
    required this.whatsappNumber,
    required this.smsNumber,
  });

  factory ContactModel.fromDto(UserDto dto) => ContactModel(
        whatsappMessage: dto.whatsappMessage,
        smsMessage: dto.smsMessage,
        whatsappNumber: dto.whatsappNumber,
        smsNumber: dto.smsNumber,
      );

  factory ContactModel.empty() => ContactModel(
        whatsappMessage: '',
        smsMessage: '',
        whatsappNumber: '',
        smsNumber: '',
      );

  factory ContactModel.mockdata() => ContactModel(
        whatsappMessage: 'whatsapp M e s s a g e',
        smsMessage: 'smsMessage',
        whatsappNumber: '+963958690017',
        smsNumber: '+963958690017',
      );
}
