import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:wassilni_maak/presentation/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: MapboxMap(
        accessToken: const String.fromEnvironment('ACCESS_TOKEN'),
        initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
        styleString: 'mapbox://styles/mapbox/streets-v11',
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.info),
        onPressed: () {},
      ),
    );
  }
}
