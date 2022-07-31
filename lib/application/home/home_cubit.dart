import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wassilni_maak/data/providers/global_data.dart';
import 'package:wassilni_maak/domain/models/contact_model.dart';
import 'package:wassilni_maak/domain/models/vehicle_model.dart';
import 'package:wassilni_maak/domain/repositories/data_repository.dart';

part 'home_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  final HomeRepository _repository = HomeRepository();

  HomeDataCubit() : super(Loading()) {
    fetch();
  }

  Future<void> fetch() async {
    emit(Loading());
    final homeData = await _repository.getHomeData();
    if (homeData.hasError) {
      emit(Failed(homeData.data));
    } else {
      contacts = homeData.data.contacts;
      instructions = homeData.data.instructions;
      vehicles = homeData.data.vehicles;
      emit(Success(
        homeData.data.vehicles,
        homeData.data.instructions,
        homeData.data.contacts,
      ));
    }
  }

  Future<void> sendMessageVia(
    String message,
    String number,
    ContactApp app,
  ) async {
    var url = '';
    if (app == ContactApp.sms) {
      url = 'sms:$number?body=$message';
    } else if (app == ContactApp.whatsapp) {
      url = 'https://wa.me/$number?text=$message';
    }
    var uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @Deprecated('use send message via insted')
  Future<void> navigateToWhatsapp(String message, String number) async {
    String whatsappUrl = 'https://wa.me/$number?text=$message';
    var uri = Uri.parse(whatsappUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @Deprecated('use send message via insted')
  Future<void> navigateToSMS(String message, String number) async {
    String smsUrl = 'sms:$number?body=$message';
    var uri = Uri.parse(smsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
