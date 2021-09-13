import 'package:flutter/material.dart';

import 'package:shoes_seccion12/widgets/widgets.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoSizePreview(),
                  ),
                  ZapatoDescripcion(),
                  ZapatoDescripcion(),
                ],
              ),
            ),
          ),
          AgregarCarritoBoton(monto: 123),
        ],
      ),
    );
  }
}
