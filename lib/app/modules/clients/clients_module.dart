import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhas_vendas/app/modules/clients/clients_page.dart';
import 'package:minhas_vendas/app/modules/clients/repositories/clients_repository_firebase.dart';
import 'package:minhas_vendas/app/modules/clients/repositories/clients_repository_interf_firebase.dart';

import 'clients_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientsController(i.get())),
        Bind<IClientesRepository>(
            (i) => ClientesRepositoryFirebase(FirebaseFirestore.instance)),

        //Bind<ITodoRepository>((i) => TodoHasuraRepository(i.get())),
        //Bind((i) =>
        //   HasuraConnect('https://minhasvendas.herokuapp.com/v1/graphql')),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => ClientsPage()),
      ];

  static Inject get to => Inject<ClientesModule>.of();
}
