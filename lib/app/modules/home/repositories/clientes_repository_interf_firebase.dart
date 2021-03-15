import '../models/clientes_model.dart';

abstract class IClientesRepository {
  Stream<List<ClientesModel>> getClientes();

  Future save(ClientesModel model);

  Future delete(ClientesModel model);
}
