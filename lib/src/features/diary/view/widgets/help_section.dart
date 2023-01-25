import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  final VoidCallback? onPressed;

  const HelpSection({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Add to site diary',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          IconButton(
            key: const Key('help-button'),
            onPressed: onPressed,
            icon: const Icon(
              Icons.help_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
