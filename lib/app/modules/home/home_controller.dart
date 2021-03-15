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
}
