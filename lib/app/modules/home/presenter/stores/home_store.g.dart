// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$titleAtom = Atom(name: 'HomeStoreBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$featuresAtom =
      Atom(name: 'HomeStoreBase.features', context: context);

  @override
  ObservableList<Featured> get features {
    _$featuresAtom.reportRead();
    return super.features;
  }

  @override
  set features(ObservableList<Featured> value) {
    _$featuresAtom.reportWrite(value, super.features, () {
      super.features = value;
    });
  }

  late final _$stateAtom = Atom(name: 'HomeStoreBase.state', context: context);

  @override
  IFeaturedState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(IFeaturedState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchFeaturesAsyncAction =
      AsyncAction('HomeStoreBase.fetchFeatures', context: context);

  @override
  Future<void> fetchFeatures() {
    return _$fetchFeaturesAsyncAction.run(() => super.fetchFeatures());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setTitle(String source) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTitle');
    try {
      return super.setTitle(source);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
features: ${features},
state: ${state}
    ''';
  }
}
