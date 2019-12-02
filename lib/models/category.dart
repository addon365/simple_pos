class Category {
  String id;
  String name;
  Category({this.id, this.name});
  Category.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['Id'];
    name = jsonMap['Name'];
  }

  static List<Category> fromJsonArray(List<Map<String, dynamic>> jsonMapList) {
    List<Category> brands = new List<Category>();
    jsonMapList.forEach((jsonMap) {
      brands.add(Category.fromJson(jsonMap));
    });
    return brands;
  }
}
