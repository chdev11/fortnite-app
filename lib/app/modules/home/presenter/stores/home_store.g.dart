// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$packagesAtom =
      Atom(name: 'HomeStoreBase.packages', context: context);

  @override
  ObservableList<Featured> get packages {
    _$packagesAtom.reportRead();
    return super.packages;
  }

  @override
  set packages(ObservableList<Featured> value) {
    _$packagesAtom.reportWrite(value, super.packages, () {
      super.packages = value;
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

  @override
  String toString() {
    return '''
packages: ${packages},
state: ${state}
    ''';
  }
}
