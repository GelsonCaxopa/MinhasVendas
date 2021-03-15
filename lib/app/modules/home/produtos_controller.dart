import 'package:mobx/mobx.dart';
import 'models/produtos_model.dart';
import 'repositories/produtos_repository_interfaces.dart';
part 'produtos_controller.g.dart';

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
