import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return MaterialApp(
          home: SafeArea(
            child: Container(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
