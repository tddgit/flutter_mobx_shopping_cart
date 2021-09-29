// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cart on _Cart, Store {
  Computed<List<Product>>? _$uniqueProductsComputed;

  @override
  List<Product> get uniqueProducts => (_$uniqueProductsComputed ??=
          Computed<List<Product>>(() => super.uniqueProducts,
              name: '_Cart.uniqueProducts'))
      .value;

  final _$_cartContentAtom = Atom(name: '_Cart._cartContent');

  @override
  ObservableList<Product> get _cartContent {
    _$_cartContentAtom.reportRead();
    return super._cartContent;
  }

  @override
  set _cartContent(ObservableList<Product> value) {
    _$_cartContentAtom.reportWrite(value, super._cartContent, () {
      super._cartContent = value;
    });
  }

  @override
  String toString() {
    return '''
uniqueProducts: ${uniqueProducts}
    ''';
  }
}
