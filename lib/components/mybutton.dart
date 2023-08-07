import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        color: const Color.fromARGB(255, 62, 62, 62),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
