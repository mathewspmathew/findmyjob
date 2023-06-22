import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final Function()? onPressed;
  const SocialButton({
    Key? key,
    required this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          height: 32,
        ),
      ),
    );
  }
}
