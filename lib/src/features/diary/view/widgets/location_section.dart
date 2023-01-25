import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  final String location;

  const LocationSection({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 16.0,
          top: 16.0,
          bottom: 16.0,
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on_sharp),
            const SizedBox(width: 8.0),
            Text(location),
          ],
        ),
      ),
    );
  }
}
