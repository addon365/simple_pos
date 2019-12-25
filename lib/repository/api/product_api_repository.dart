import 'dart:convert';

import 'package:simple_pos/dependency/contants.dart';
import 'package:simple_pos/models/brand.dart';
import 'package:simple_pos/models/catelog_item.dart';

import 'package:http/http.dart' as http;
import 'package:simple_pos/repository/product_repository.dart';

class ProductApiRepository implements ProductRepository {
  static ProductApiRepository _cache;

  factory ProductApiRepository() {
    if (_cache == null) {
      _cache = new ProductApiRepository._internal();
    }
    return _cache;
  }

  ProductApiRepository._internal();

  Future<List<CatelogItem>> fetchAllProducts() async {
    String url = '$baseUrl/CatelogItem';
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var mapList = List<Map<String, dynamic>>.from(json.decode(result.body));
      return CatelogItem.fromJsonArray(mapList);
    } else {
      return null;
    }
  }

  Future<List<Brand>> fetchAllBrands() async {
    String url = '$baseUrl/Brands';
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var mapList = List<Map<String, dynamic>>.from(json.decode(result.body));
      return Brand.fromJsonArray(mapList);
    } else {
      return null;
    }
  }

  Future<List<Brand>> fetchAllCateogries() async {
    String url = '$baseUrl/Category';
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var mapList = List<Map<String, dynamic>>.from(json.decode(result.body));
      return Brand.fromJsonArray(mapList);
    } else {
      return null;
    }
  }
}
