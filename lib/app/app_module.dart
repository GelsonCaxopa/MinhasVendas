import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:minhas_vendas/app/app_widget.dart';
import 'package:minhas_vendas/app/splash/splash_page.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/home/produtos_module.dart';
import 'modules/login/login_module.dart';
import 'modules/login/repositories/auth_controller.dart';
import 'modules/login/repositories/auth_repository.dart';
import 'modules/login/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashScreen()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/viewProdutos', module: ProdutosModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
