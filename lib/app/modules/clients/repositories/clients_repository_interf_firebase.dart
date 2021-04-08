import 'package:minhas_vendas/app/modules/models/clients_model.dart';

abstract class IClientesRepository {
  Stream<List<ClientesModel>> getClientes();

  Future save(ClientesModel model);

  Future delete(ClientesModel model);
}
