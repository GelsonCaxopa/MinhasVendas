import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhas_vendas/app/modules/models/product_model.dart';

import 'product_repository_interfaces.dart';

class ProdutosRepositoryFirebase implements IProdutosRepository {
  final FirebaseFirestore firestore;

  ProdutosRepositoryFirebase(this.firestore);

  @override
  Stream<List<ProdutosModel>> getProdutos() {
    return firestore.collection('Produtos').snapshots().map((query) {
      return query.docs.map((doc) {
        return ProdutosModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future delete(ProdutosModel model) {
    return model.pReference.delete();
  }

  @override
  Future save(ProdutosModel model) async {
    if (model.pReference == null) {
      model.pReference =
          await FirebaseFirestore.instance.collection('Produtos').add({
        'descricao': model.descricao,
        'sabor': model.sabor,
        'pid': Random().nextInt(20),
        'valor': model.valor
      });
    } else {
      model.pReference.update({
        'descricao': model.descricao,
        'sabor': model.sabor,
      });
    }
  }
}
