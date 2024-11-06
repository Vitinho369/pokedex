import 'package:flutter/material.dart';

class MenssageCapture extends StatelessWidget {
  late String text;
  MenssageCapture({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
