import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutosModel {
  String descricao;
  String sabor;
  int pid;
  String valor;

  DocumentReference pReference;

  ProdutosModel({
    this.pReference,
    this.pid,
    this.descricao,
    this.valor,
    this.sabor,
  });

  factory ProdutosModel.fromDocument(DocumentSnapshot doc) {
    return ProdutosModel(
        descricao: doc['descricao'],
        sabor: doc['sabor'],
        pid: doc['pid'],
        valor: doc['valor'],
        pReference: doc.reference);
  }
}
