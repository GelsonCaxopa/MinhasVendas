import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhas_vendas/app/modules/models/clients_model.dart';

import 'clients_repository_interf_firebase.dart';

class ClientesRepositoryFirebase implements IClientesRepository {
  final FirebaseFirestore firestore;

  ClientesRepositoryFirebase(this.firestore);

  @override
  Stream<List<ClientesModel>> getClientes() {
    return firestore.collection('Clientes').snapshots().map((query) {
      return query.docs.map((doc) {
        return ClientesModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future delete(ClientesModel model) {
    return model.reference.delete();
  }

  @override
  Future save(ClientesModel model) async {
    if (model.reference == null) {
      model.reference =
          await FirebaseFirestore.instance.collection('Clientes').add({
        'nome': model.nome,
        'telefone': model.telefone,
        'cid': Random().nextInt(20),
        'conta': model.conta,
        'ativo': model.ativo,
        'pago': model.pago
      });
    } else {
      model.reference.update({
        'nome': model.nome,
        'telefone': model.telefone,
        'ativo': model.ativo,
        'pago': model.pago,
        'conta': 0
      });
    }
  }
}
