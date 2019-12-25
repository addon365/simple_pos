import 'package:simple_pos/models/brand.dart';
import 'package:simple_pos/models/catelog_item.dart';
import 'package:simple_pos/repository/product_repository.dart';

class ProductInMemoryRepository implements ProductRepository {
  static ProductInMemoryRepository _cache;

  List<CatelogItem> catelogItems = new List<CatelogItem>();

  initCatelogItems() {
    catelogItems.add(new CatelogItem(
        id: 1,
        brandId: "1",
        categoryId: "1",
        code: "SC001",
        image: "http://www.pngnames.com/files/3/Onion-Transparent-Background.png",
        name: "Long Product Name",
        price: 120.00,
        quantity: 123));
    catelogItems.add(new CatelogItem(
        id: 1,
        brandId: "1",
        categoryId: "1",
        code: "SC002",
        image: "http://www.pngmart.com/files/1/Banana-Fruit-Cartoon-PNG.png",
        name: "Product Name",
        price: 190.00,
        quantity: 123));
  }

  factory ProductInMemoryRepository() {
    if (_cache == null) {
      _cache = new ProductInMemoryRepository._internal();
      _cache.initCatelogItems();
    }
    return _cache;
  }

  ProductInMemoryRepository._internal();

  @override
  Future<List<Brand>> fetchAllBrands() async {
    return null;
  }

  @override
  Future<List<Brand>> fetchAllCateogries() async {
    // TODO: implement fetchAllCateogries
    return null;
  }

  @override
  Future<List<CatelogItem>> fetchAllProducts() async {
    return catelogItems;
  }
}
