import 'package:minhas_vendas/app/modules/clients/repositories/clients_repository_interf_firebase.dart';
import 'package:minhas_vendas/app/modules/models/clients_model.dart';
import 'package:mobx/mobx.dart';

part 'clients_controller.g.dart';

class ClientsController = _ClientsControllerBase with _$ClientsController;

abstract class _ClientsControllerBase with Store {
  final IClientesRepository repository;

  @observable
  ObservableStream<List<ClientesModel>> clientesLista;

  _ClientsControllerBase(this.repository) {
    getList();
  }

  @action
  getList() {
    clientesLista = repository.getClientes().asObservable();
  }

  Future save(ClientesModel model) => repository.save(model);

  Future delete(ClientesModel model) => repository.delete(model);
}
