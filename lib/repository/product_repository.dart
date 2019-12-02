import 'dart:convert';

import 'package:simple_pos/dependency/contants.dart';
import 'package:simple_pos/models/brand.dart';
import 'package:simple_pos/models/catelog_item.dart';

import 'package:http/http.dart' as http;

class ProductRepository {
  static ProductRepository _cache;

  factory ProductRepository() {
    if (_cache == null) {
      _cache = new ProductRepository._internal();
    }
    return _cache;
  }

  ProductRepository._internal();

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
