import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wassilni_maak/application/home/home_cubit.dart';
import 'package:wassilni_maak/config/config.dart';
import 'package:wassilni_maak/domain/models/contact_model.dart';
import 'package:wassilni_maak/presentation/widgets/vehicles_list_view.dart';
import '../widgets/widgets.dart';
import 'home_retry_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'وصلني معك'),
      body: BlocProvider(
        create: (_) => HomeDataCubit(),
        child: BlocConsumer<HomeDataCubit, HomeDataState>(
          listener: (context, state) {
            if (state is Failed) {
              showErrorSnackbar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is Success) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  const LineTitleLine(text: 'الوسائل المتاحة'),
                  SizedBox(
                    height: 37.h,
                    child: VehiclesListView(vehicles: state.vehicles),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularButton(
                        icon: Icons.pin_drop_outlined,
                        text: 'اختر الرحلة',
                        onPressed: () {
                          Navigator.of(context).pushNamed('/map');
                        },
                      ),
                      CircularButton(
                        icon: Icons.info_outline,
                        text: 'التعليمات',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return InstructionsDialog(
                                instructions: state.instructions,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  const LineTitleLine(text: 'التواصل عبر'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextIconButton(
                        text: 'whatsapp',
                        icon: FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        onPressed: () async {
                          await context.read<HomeDataCubit>().sendMessageVia(
                                state.contacts.whatsappMessage,
                                state.contacts.whatsappNumber,
                                ContactApp.whatsapp,
                              );
                        },
                      ),
                      TextIconButton(
                        text: '  SMS',
                        icon: FontAwesomeIcons.message,
                        color: Colors.yellow[700],
                        onPressed: () async {
                          await context.read<HomeDataCubit>().sendMessageVia(
                                state.contacts.smsMessage,
                                state.contacts.smsNumber,
                                ContactApp.sms,
                              );
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is Failed) {
              return RetryScreen(
                refreshFunction: context.read<HomeDataCubit>().fetch,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
