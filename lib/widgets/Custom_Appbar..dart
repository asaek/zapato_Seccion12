import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titulo;

  const CustomAppBar({
    this.titulo = 'For YOU',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          // color: Colors.amberAccent,
          child: Row(
            children: [
              Text(
                titulo,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Icon(
                Icons.search,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
