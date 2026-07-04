// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$_treinosAtom = Atom(
    name: '_HomeViewModelBase._treinos',
    context: context,
  );

  @override
  ObservableList<TreinoModel> get _treinos {
    _$_treinosAtom.reportRead();
    return super._treinos;
  }

  @override
  set _treinos(ObservableList<TreinoModel> value) {
    _$_treinosAtom.reportWrite(value, super._treinos, () {
      super._treinos = value;
    });
  }

  late final _$_HomeViewModelBaseActionController = ActionController(
    name: '_HomeViewModelBase',
    context: context,
  );

  @override
  void adicionaTreino() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.adicionaTreino',
    );
    try {
      return super.adicionaTreino();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
