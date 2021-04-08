import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhas_vendas/app/modules/models/product_model.dart';
import 'package:minhas_vendas/app/modules/modulesComponents/product_view.dart';
import 'package:minhas_vendas/app/modules/product/product_controller.dart';
import 'package:minhas_vendas/app/modules/style/theme.dart' as Theme;

class ProdutosPage extends StatefulWidget {
  final String title;
  const ProdutosPage({Key key, this.title = "Lista de Produtos"})
      : super(key: key);

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState
    extends ModularState<ProdutosPage, ProdutosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home_rounded, size: 30),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
        title: Container(
            alignment: AlignmentDirectional(-0.3, 0),
            child: Text(widget.title,
                style: TextStyle(
                    color: Colors.teal[900], fontWeight: FontWeight.bold))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/viewProdutos');
            },
          ),
        ],
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
                if (controller.produtosLista.hasError) {
                  print(controller.produtosLista.error);
                  return Center(
                    child: ElevatedButton(
                      onPressed: controller.getListP(),
                      child: Text('Erro'),
                    ),
                  );
                }
                if (controller.produtosLista.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<ProdutosModel> list = controller.produtosLista.data;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    ProdutosModel model = list[index];

                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue[900].withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(2, 2),
                              ),
                            ],
                            color: Colors.teal[300],
                          ),
                          margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                          child: Text(
                              '     PRODUTOS        |            SABOR            |          VALOR      ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Paytone On',
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                        SizedBox(
                          height: 55,
                          child: Dismissible(
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
                            key: Key(model.descricao),
                            child: Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                color: Colors.teal[300],
                              ),
                              margin: const EdgeInsets.fromLTRB(20, 9, 20, 2),
                              child: ItemTilesP(
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
                                            "Você tem certeza que gostaria de excluir o cliente ${model.descricao}?"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text(
                                              "Delete",
                                              style:
                                                  TextStyle(color: Colors.red),
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
                                            "Gostaria de Zerar a conta do Cliente ${model.descricao}?"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                                return res1;
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.add_circle_rounded, size: 30),
      ),
    );
  }

  _showDialog([ProdutosModel model]) {
    model ??= ProdutosModel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastrar novo produtos'),
          content: Form(
              child: Container(
            height: MediaQuery.of(context).size.height / 3.8,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Descrição',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => model.descricao = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Sabor',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => model.sabor = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Valor',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => model.valor = value,
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
