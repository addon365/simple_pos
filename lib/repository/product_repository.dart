import 'package:simple_pos/dependency/contants.dart';
import 'package:simple_pos/models/brand.dart';
import 'package:simple_pos/models/catelog_item.dart';
import 'package:simple_pos/repository/api/product_api_repository.dart';
import 'package:simple_pos/repository/in_memory/product_in_memory_repository.dart';

abstract class ProductRepository {
  Future<List<CatelogItem>> fetchAllProducts();
  Future<List<Brand>> fetchAllBrands();
  Future<List<Brand>> fetchAllCateogries();
  static ProductRepository getRepository() {
    return (isLocal) ? ProductInMemoryRepository() : ProductApiRepository();
  }
}
