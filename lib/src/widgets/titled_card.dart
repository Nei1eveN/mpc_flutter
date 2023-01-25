import 'package:flutter/material.dart';

class TitledCard extends StatelessWidget {
  final String title;

  final Widget? titlePartner;
  final MainAxisAlignment titleMainAxisAlignment;

  final Widget child;

  const TitledCard({
    super.key,
    this.titlePartner,
    this.titleMainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: titleMainAxisAlignment,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                if (titlePartner != null) ...[
                  titlePartner!,
                ],
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: child,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
