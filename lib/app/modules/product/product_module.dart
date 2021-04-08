import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'product_cad.dart';
import 'product_controller.dart';
import 'repositories/product_repository_firebase.dart';
import 'repositories/product_repository_interfaces.dart';

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
