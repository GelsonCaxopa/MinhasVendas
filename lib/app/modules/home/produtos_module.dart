import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhas_vendas/app/modules/home/repositories/produtos_repository_firebase.dart';
import '../produtos_cad.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'produtos_controller.dart';
import 'repositories/produtos_repository_interfaces.dart';

class ProdutosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutosController(i.get())),
        Bind<IProdutosRepository>(
            (i) => ProdutosRepositoryFirebase(FirebaseFirestore.instance)),

        //Bind<ITodoRepository>((i) => TodoHasuraRepository(i.get())),
        //Bind((i) =>
        //   HasuraConnect('https://minhasvendas.herokuapp.com/v1/graphql')),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => ProdutosPage()),
      ];

  static Inject get to => Inject<ProdutosModule>.of();
}
