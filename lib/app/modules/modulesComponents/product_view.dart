import 'package:flutter/material.dart';
import 'package:minhas_vendas/app/modules/models/product_model.dart';

class ItemTilesP extends StatelessWidget {
  final ProdutosModel model;

  const ItemTilesP({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: const EdgeInsets.fromLTRB(10, 0.35, 10, 10),
        child: Text(
          model.descricao,
          style: TextStyle(
            color: Colors.brown[900],
            fontSize: 22,
            fontFamily: 'Paytone On',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.fromLTRB(0.5, 0.35, 10, 10),
        child: Text(
          model.sabor,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Paytone On',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      trailing: Container(
        margin: const EdgeInsets.fromLTRB(0.5, 0.35, 23, 10),
        child: Text(
          model.valor,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Paytone On',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
