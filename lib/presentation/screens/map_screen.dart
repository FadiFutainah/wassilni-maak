import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassilni_maak/application/map/map_cubit.dart';
import 'package:wassilni_maak/config/config.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'home_retry_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: BlocConsumer<MapCubit, MapState>(
        listener: (context, state) {
          if (state is GetDistanceFialed) {
            showErrorSnackbar(context, state.message);
            context.read<MapCubit>().backToChooseDistance();
          } else if (state is TripChoosed) {
            Navigator.of(context).popAndPushNamed('/order');
          }
        },
        builder: (context, state) {
          if (state is Failed) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'https://www.google.com/maps/...',
                  style: GoogleFonts.ubuntu(fontSize: 16),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: Navigator.of(context).pop,
                ),
              ),
              body: RetryScreen(
                refreshFunction: context.read<MapCubit>().getScript,
              ),
            );
          }
          if (state is Success || state is GetDistanceFialed) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'اختر الرحلة',
                  style: GoogleFonts.tajawal(fontSize: 24, color: Colors.white),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: Navigator.of(context).pop,
                ),
                actions: [
                  IconButton(
                    onPressed: context.read<MapCubit>().grabDistance,
                    icon: const Icon(Icons.done),
                  )
                ],
              ),
              body: WebView(
                onWebResourceError: context.read<MapCubit>().websiteFailed,
                initialUrl: context.read<MapCubit>().initialUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  context.read<MapCubit>().initWebPage(controller);
                },
                navigationDelegate: (navigation) {
                  return NavigationDecision.prevent;
                },
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'https://www.google.com/maps/...',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: Navigator.of(context).pop,
              ),
            ),
            body: Container(
              color: Colors.white,
              child: const LinearProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
