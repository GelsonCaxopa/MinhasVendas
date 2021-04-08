// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientsController on _ClientsControllerBase, Store {
  final _$clientesListaAtom =
      Atom(name: '_ClientsControllerBase.clientesLista');

  @override
  ObservableStream<List<ClientesModel>> get clientesLista {
    _$clientesListaAtom.reportRead();
    return super.clientesLista;
  }

  @override
  set clientesLista(ObservableStream<List<ClientesModel>> value) {
    _$clientesListaAtom.reportWrite(value, super.clientesLista, () {
      super.clientesLista = value;
    });
  }

  final _$_ClientsControllerBaseActionController =
      ActionController(name: '_ClientsControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_ClientsControllerBaseActionController.startAction(
        name: '_ClientsControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_ClientsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientesLista: ${clientesLista}
    ''';
  }
}
