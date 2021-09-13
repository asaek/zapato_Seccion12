import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_seccion12/models/Providers.dart';
import 'package:shoes_seccion12/screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoModel()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shoes App',
        debugShowCheckedModeBanner: false,
        home: ZapatoPage());
  }
}
