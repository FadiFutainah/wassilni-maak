import 'package:flutter/material.dart';
import 'vehicle_card.dart';
import 'package:wassilni_maak/domain/models/vehicle_model.dart';
import 'package:wassilni_maak/presentation/widgets/widgets.dart';

class VehiclesListView extends StatelessWidget {
  final List<VehicleModel> vehicles;

  const VehiclesListView({
    required this.vehicles,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: vehicles.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return InstructionsDialog(
                  instructions: vehicles[index].instructions,
                );
              },
            );
          },
          child: VehicleCard(vehicle: vehicles[index]),
        );
      },
    );
  }
}
