import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_pos/models/catelog_item.dart';
import 'package:simple_pos/repository/product_repository.dart';

class ProductBloc {
  var _filterIndex = 0;
  var _allProducts = <CatelogItem>[];

  final _allProductsSubject =
      BehaviorSubject<UnmodifiableListView<CatelogItem>>();
  final _filterIndexSubject = BehaviorSubject<int>();

  Stream<UnmodifiableListView<CatelogItem>> get allProducts =>
      _allProductsSubject.stream;

  Stream<int> get filteredIndex => _filterIndexSubject.stream;

  ProductBloc() {
    fetchAllProducts();
  }
  void fetchAllProducts() {
    updateAllProducts().then((_) {
      _allProductsSubject.add(UnmodifiableListView(_allProducts));
    });
  }

  updateFilterIndex(int index) {
    _filterIndex = index;
    _filterIndexSubject.add(_filterIndex);
    switch (index) {
      case 0:
        fetchAllProducts();
        break;
      case 1:
        fetchByCategory("MSI");
        break;
      case 2:
        fetchByCategory("LSI");
        break;
    }
  }

  Future<Null> updateAllProducts() async {
    _allProducts = await ProductRepository.getRepository().fetchAllProducts();
    return Future.value(null);
  }

  void dispose() {
    _allProductsSubject.close();
  }

  void fetchByCategory(String strCode) {
    var filterResult =
        _allProducts.where((product) => product.code.compareTo(strCode) == 0);
    _allProductsSubject.add(UnmodifiableListView(filterResult));
  }
}

final productBloc = ProductBloc();
