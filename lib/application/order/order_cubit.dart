import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wassilni_maak/data/providers/global_data.dart';
import 'package:wassilni_maak/domain/models/contact_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  String? smsMessage;
  String? whatsappMessage;
  int selected = 0;

  OrderCubit() : super(OrderInitial(distance!, 0));

  void _composeMessages(int price) {
    smsMessage = contacts?.smsMessage.replaceFirst('السعر', '$price');
    whatsappMessage = contacts?.whatsappMessage.replaceFirst('السعر', '$price');
  }

  void select(int index) {
    selected = index;
    emit(SelectedChanged(distance!, index));
  }

  Color tileColor(index) {
    return (index == selected) ? Colors.grey[400] ?? Colors.grey : Colors.white;
  }

  Color tileBorderColor(index) {
    return (index == selected) ? Colors.blue : Colors.white;
  }

  Future<void> sendMessageVia(ContactApp app) async {
    _composeMessages(vehicles![selected].calculatePrice(distance!));
    var url = '';
    if (app == ContactApp.sms) {
      url = 'sms:${contacts!.smsNumber}?body=$smsMessage';
    } else if (app == ContactApp.whatsapp) {
      url = 'https://wa.me/${contacts!.whatsappNumber}?text=$whatsappMessage';
    }
    var uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
