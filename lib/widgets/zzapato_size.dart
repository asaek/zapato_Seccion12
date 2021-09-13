import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_seccion12/models/zapato_model.dart';
import 'package:shoes_seccion12/screens/screens.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (this.fullScreen) ? 5 : 30,
            vertical: (this.fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFD54F),
            borderRadius: (this.fullScreen)
                ? BorderRadius.vertical(
                    top: Radius.circular(30),
                    bottom: Radius.circular(50),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              _ZapatoConSombre(),
              if (!this.fullScreen) _ZapatoTallas(),
            ],
          ),
        ),
      ),
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(talla: 7),
          _TallaZapatoCaja(talla: 7.5),
          _TallaZapatoCaja(talla: 8),
          _TallaZapatoCaja(talla: 8.5),
          _TallaZapatoCaja(talla: 9),
          _TallaZapatoCaja(talla: 9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double talla;

  const _TallaZapatoCaja({required this.talla});

  @override
  Widget build(BuildContext context) {
    final ZapatoModel zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<ZapatoModel>(context, listen: false).talla = this.talla;
      },
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (this.talla == zapatoModel.talla)
              ? Color(0xffF1A23A)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            //TODO agregar el box shadown individual
            if (this.talla == zapatoModel.talla)
              BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Text(
          //TODO Esto es muy interesante como remplazar cosas
          talla.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (this.talla == zapatoModel.talla)
                  ? Colors.white
                  : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _ZapatoConSombre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorZapatoModel = Provider.of<ZapatoModel>(context).assetImage;
    return Stack(
      children: [
        Positioned(
          right: 10,
          bottom: 100,
          child: _ZapatoSombra(),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Image(
            image: AssetImage(colorZapatoModel),
          ),
        )
      ],
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.55,
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}
