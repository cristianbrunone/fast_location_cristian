// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$recentListAtom =
      Atom(name: '_HomeController.recentList', context: context);

  @override
  ObservableList<AddressModel> get recentList {
    _$recentListAtom.reportRead();
    return super.recentList;
  }

  @override
  set recentList(ObservableList<AddressModel> value) {
    _$recentListAtom.reportWrite(value, super.recentList, () {
      super.recentList = value;
    });
  }

  late final _$selectedAddressAtom =
      Atom(name: '_HomeController.selectedAddress', context: context);

  @override
  AddressModel? get selectedAddress {
    _$selectedAddressAtom.reportRead();
    return super.selectedAddress;
  }

  @override
  set selectedAddress(AddressModel? value) {
    _$selectedAddressAtom.reportWrite(value, super.selectedAddress, () {
      super.selectedAddress = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('_HomeController.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$getAddressByCepAsyncAction =
      AsyncAction('_HomeController.getAddressByCep', context: context);

  @override
  Future<void> getAddressByCep(String cep) {
    return _$getAddressByCepAsyncAction.run(() => super.getAddressByCep(cep));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
recentList: ${recentList},
selectedAddress: ${selectedAddress}
    ''';
  }
}
