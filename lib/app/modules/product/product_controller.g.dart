// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosController on _ProdutosControllerBase, Store {
  final _$produtosListaAtom =
      Atom(name: '_ProdutosControllerBase.produtosLista');

  @override
  ObservableStream<List<ProdutosModel>> get produtosLista {
    _$produtosListaAtom.reportRead();
    return super.produtosLista;
  }

  @override
  set produtosLista(ObservableStream<List<ProdutosModel>> value) {
    _$produtosListaAtom.reportWrite(value, super.produtosLista, () {
      super.produtosLista = value;
    });
  }

  final _$_ProdutosControllerBaseActionController =
      ActionController(name: '_ProdutosControllerBase');

  @override
  dynamic getListP() {
    final _$actionInfo = _$_ProdutosControllerBaseActionController.startAction(
        name: '_ProdutosControllerBase.getListP');
    try {
      return super.getListP();
    } finally {
      _$_ProdutosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produtosLista: ${produtosLista}
    ''';
  }
}
