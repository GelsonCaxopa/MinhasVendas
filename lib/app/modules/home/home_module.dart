import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhas_vendas/app/modules/home/home_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/clientes_repository_firebase.dart';
import 'repositories/clientes_repository_interf_firebase.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind<IClientesRepository>(
            (i) => ClientesRepositoryFirebase(FirebaseFirestore.instance)),

        //Bind<ITodoRepository>((i) => TodoHasuraRepository(i.get())),
        //Bind((i) =>
        //   HasuraConnect('https://minhasvendas.herokuapp.com/v1/graphql')),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
