import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhas_vendas/app/modules/models/clients_model.dart';
import 'package:minhas_vendas/app/modules/modulesComponents/clients_tile.dart';

import 'package:minhas_vendas/app/modules/style/theme.dart' as Theme;
import 'clients_controller.dart';

class ClientsPage extends StatefulWidget {
  final String title;
  const ClientsPage({Key key, this.title = "Lista de Clientes"})
      : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends ModularState<ClientsPage, ClientsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,
              size: 30, color: Colors.red[900]),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
              color: Theme.Colors.backGround,
            ),
            child: Observer(
              builder: (_) {
                if (controller.clientesLista.hasError) {
                  print(controller.clientesLista.error);
                  return Center(
                    child: ElevatedButton(
                      onPressed: controller.getList,
                      child: Text('Erro'),
                    ),
                  );
                }
                if (controller.clientesLista.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<ClientesModel> list = controller.clientesLista.data;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    ClientesModel model = list[index];

                    return Dismissible(
                      secondaryBackground: Container(
                        alignment: AlignmentDirectional(0.8, 0),
                        color: Colors.red[900],
                        child: Icon(Icons.delete_outline_rounded,
                            color: Colors.white, size: 34),
                      ),
                      background: Container(
                        alignment: AlignmentDirectional(-0.8, 0),
                        color: Colors.blue[900],
                        child: Icon(Icons.local_atm_rounded,
                            color: Colors.white, size: 38),
                      ),
                      key: Key(model.nome),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 20.0,
                            ),
                          ],
                          color: Colors.orange,
                        ),
                        margin: const EdgeInsets.fromLTRB(20, 15, 20, 2),
                        child: ItemTiles(
                          model: model,
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          final bool res = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "Você tem certeza que gostaria de excluir o cliente ${model.nome}?"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        controller.delete(model);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                          return res;
                        } else {
                          final bool res1 = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "Gostaria de Zerar a conta do Cliente ${model.nome}?"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    Checkbox(
                                      checkColor: Colors.blue[900],
                                      value: model.pago,
                                      onChanged: (pago) {
                                        model.pago = pago;

                                        controller.save(model);

                                        Modular.to.pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                          return res1;
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.orange[900],
        backgroundColor: Colors.yellow[800],
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.add_circle_rounded, size: 30),
      ),
    );
  }

  _showDialog([ClientesModel model]) {
    model ??= ClientesModel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastrar novo cliente'),
          content: Form(
              child: Container(
            height: MediaQuery.of(context).size.height / 3.8,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => model.nome = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Telefone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => model.telefone = value,
                ),
              ],
            ),
          )),
          actions: [
            TextButton(
              onPressed: () => Modular.to.pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await controller.save(model);
                Modular.to.pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
