import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhas_vendas/app/menu/menu_page.dart';

class MenuModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => MenuPage()),
      ];

  static Inject get to => Inject<MenuModule>.of();
}
