import 'package:flutter/material.dart';
import 'package:minhas_vendas/app/modules/models/clients_model.dart';

class ItemTiles extends StatelessWidget {
  final ClientesModel model;

  const ItemTiles({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        child: MaterialButton(
          //avatar e botão para editar Cadastro cliente
          child: CircleAvatar(
            child: Icon(Icons.person, color: Colors.black),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/infoclientes');
          },
          shape: CircleBorder(),
        ),
      ),
      title: Text(
        model.nome,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Paytone On',
          fontWeight: FontWeight.w800,
        ),
      ),
      trailing: Container(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
