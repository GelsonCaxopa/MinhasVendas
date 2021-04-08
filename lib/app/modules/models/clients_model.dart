import 'package:cloud_firestore/cloud_firestore.dart';

class ClientesModel {
  String nome;
  String telefone;
  int cid;
  int conta;
  bool ativo;
  bool pago;
  DocumentReference reference;

  ClientesModel(
      {this.reference,
      this.cid,
      this.nome,
      this.telefone,
      this.conta = 0,
      this.ativo = true,
      this.pago = false});

  factory ClientesModel.fromDocument(DocumentSnapshot doc) {
    return ClientesModel(
        nome: doc['nome'],
        telefone: doc['telefone'],
        cid: doc['cid'],
        conta: doc['conta'],
        ativo: doc['ativo'],
        pago: doc['pago'],
        reference: doc.reference);
  }
  factory ClientesModel.fromJson(Map doc) {
    return ClientesModel(
        nome: doc['nome'],
        telefone: doc['telefone'],
        cid: doc['cid'],
        conta: doc['conta'],
        ativo: doc['ativo'],
        pago: doc['pago']);
  }
}
