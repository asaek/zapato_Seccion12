import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_seccion12/helpers/helpers.dart';
import 'package:shoes_seccion12/models/zapato_model.dart';
import 'package:shoes_seccion12/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusADark();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 60,
                left: 10,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    cambiarStatusALight();

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ZapatoDescripcion(),
                  _MontoBuyNow(),
                  _SeletedColorMOreItems(),
                  _BotonesLikeCartSettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BotonSombreado(
              icon: Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 25,
          )),
          _BotonSombreado(
              icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
          _BotonSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  final Color color;
  final double tamano;

  const _BotonSombreado({
    required this.icon,
    this.color = Colors.white,
    this.tamano = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
    );
  }
}

class _SeletedColorMOreItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _BotonColor(
                    color: Color(0xff364D56),
                    index: 1,
                    zapatoColor: 'assets/negro.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                      color: Color(0xff2099F1),
                      index: 2,
                      zapatoColor: 'assets/azul.png'),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                      color: Color(0xffFFAD29),
                      index: 3,
                      zapatoColor: 'assets/amarillo.png'),
                ),
                _BotonColor(
                    color: Color(0xffC6D642),
                    index: 4,
                    zapatoColor: 'assets/verde.png'),
              ],
            ),
          ),
          // Spacer(),
          Bounce(
            delay: Duration(milliseconds: 1000),
            from: 8,
            child: BotonNaranja(
              height: 30,
              width: 140,
              texto: 'More Items Related',
              coolor: Color(0xffFFC675),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String zapatoColor;

  const _BotonColor({
    required this.color,
    required this.index,
    required this.zapatoColor,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        onTap: () {
          Provider.of<ZapatoModel>(context, listen: false).assetImage =
              zapatoColor;
        },
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: Row(
          children: [
            Text(
              '\$180',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            BotonNaranja(
              texto: 'Buy Now',
              width: 90,
              height: 30,
              coolor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
