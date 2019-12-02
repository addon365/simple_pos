class CartItem {
  int id;
  String name;
  String code;
  double quantity;
  double price;
  String image;
  String brandId;
  String categoryId;

  CartItem(
      {this.id,
      this.name,
      this.code,
      this.quantity,
      this.price,
      this.image,
      this.categoryId,
      this.brandId});
  CartItem.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['Id'];
    name = jsonMap['itemName'];
    code = jsonMap['productCode'];
    categoryId = jsonMap['categoryId'];
    brandId = jsonMap['brandId'];
    image = jsonMap['image'];
    price = jsonMap['price'];
  }

  static List<CartItem> fromJsonArray(List<Map<String, dynamic>> jsonMapList) {
    List<CartItem> brands = new List<CartItem>();
    jsonMapList.forEach((jsonMap) {
      brands.add(CartItem.fromJson(jsonMap));
    });
    return brands;
  }
}
