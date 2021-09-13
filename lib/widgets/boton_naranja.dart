import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double width, height;
  final Color coolor;

  const BotonNaranja({
    required this.texto,
    required this.width,
    required this.height,
    required this.coolor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: coolor,
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
