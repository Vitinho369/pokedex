import 'package:flutter/material.dart';

class MessageCapture extends StatelessWidget {
  late String text;
  MessageCapture({
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
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
