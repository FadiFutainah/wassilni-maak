import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wassilni_maak/domain/models/vehicle_model.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  final VehicleModel vehicle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(4),
      child: SizedBox(
        width: 210,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              vehicle.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CachedNetworkImage(
                imageUrl: vehicle.image,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 130,
                width: 150,
              ),
            ),
            Text(
              'عدد الركاب',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${vehicle.maxPassengers}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Icon(
                  Icons.people_rounded,
                  color: Colors.blue,
                  size: 35,
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
