import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhas_vendas/app/modules/ui/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Slidy',
        theme: ThemeData(),
        initialRoute: '/login',
        onGenerateRoute: Modular.generateRoute,
        routes: {
          '/login': (context) => LoginPage(),
          //'/listaVendas': (context) => ListaVendas(),
        });
  }
}
