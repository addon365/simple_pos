class CatelogItem {
  int id;
  String name;
  String code;
  double quantity;
  double price;
  String image;
  String brandId;
  String categoryId;

  CatelogItem(
      {this.id,
      this.name,
      this.code,
      this.quantity,
      this.price,
      this.image,
      this.categoryId,
      this.brandId});
  CatelogItem.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['Id'];
    name = jsonMap['itemName'];
    code = jsonMap['productCode'];
    categoryId = jsonMap['categoryId'];
    brandId = jsonMap['brandId'];
    image = jsonMap['image'];
    price = jsonMap['price'];
  }

  static List<CatelogItem> fromJsonArray(
      List<Map<String, dynamic>> jsonMapList) {
    List<CatelogItem> brands = new List<CatelogItem>();
    jsonMapList.forEach((jsonMap) {
      brands.add(CatelogItem.fromJson(jsonMap));
    });
    return brands;
  }
}
