import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  final String route;
  final String textButton;
  const ButtonNavigation({
    super.key,
    required this.route,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: Colors.black,
            backgroundColor: Colors.red,
            minimumSize: Size(100, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(textButton,
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
