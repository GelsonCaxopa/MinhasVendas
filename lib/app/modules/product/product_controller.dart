import 'package:minhas_vendas/app/modules/models/product_model.dart';
import 'package:minhas_vendas/app/modules/product/repositories/product_repository_interfaces.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProdutosController = _ProdutosControllerBase with _$ProdutosController;

abstract class _ProdutosControllerBase with Store {
  final IProdutosRepository pRepository;

  @observable
  ObservableStream<List<ProdutosModel>> produtosLista;

  _ProdutosControllerBase(this.pRepository) {
    getListP();
  }

  @action
  getListP() {
    produtosLista = pRepository.getProdutos().asObservable();
  }

  Future save(ProdutosModel model) => pRepository.save(model);

  Future delete(ProdutosModel model) => pRepository.delete(model);
}
