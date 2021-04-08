import 'package:minhas_vendas/app/modules/login/repositories/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'menu_controller.g.dart';

@Injectable()
class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  logOut() async {
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
