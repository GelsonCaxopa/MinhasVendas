import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhas_vendas/app/modules/login/repositories/auth_controller.dart';
import 'package:mobx/mobx.dart';

import 'models/clientes_model.dart';
import 'repositories/clientes_repository_interf_firebase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IClientesRepository repository;

  @observable
  ObservableStream<List<ClientesModel>> clientesLista;

  _HomeControllerBase(this.repository) {
    getList();
  }

  @action
  getList() {
    clientesLista = repository.getClientes().asObservable();
  }

  Future save(ClientesModel model) => repository.save(model);

  Future delete(ClientesModel model) => repository.delete(model);

  logOut() async {
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
