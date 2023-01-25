import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String title;

  final EdgeInsets buttonPadding;
  final VoidCallback? onPressed;

  final bool isLoading;

  const GreenButton({
    super.key,
    required this.title,
    this.onPressed,
    this.buttonPadding = const EdgeInsets.symmetric(horizontal: 20.0),
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: buttonPadding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 60.0,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
