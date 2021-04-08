import 'package:minhas_vendas/app/modules/models/product_model.dart';

abstract class IProdutosRepository {
  Stream<List<ProdutosModel>> getProdutos();

  Future save(ProdutosModel model);

  Future delete(ProdutosModel model);
}
