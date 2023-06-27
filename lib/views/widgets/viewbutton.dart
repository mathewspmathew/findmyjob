import 'package:flutter/material.dart';
import '../../constants.dart';

class ViewButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ViewButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kButtonColor,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(16.0),
        ),
      ),
      onPressed: onPressed,
      child: Text('View'),
    );
  }
}
