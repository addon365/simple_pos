class Brand {
  String id;
  String companyName;
  Brand({this.id, this.companyName});

  Brand.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['Id'];
    companyName = jsonMap['CompanyName'];
  }

  static List<Brand> fromJsonArray(
      List<Map<String, dynamic>> jsonMapList) {
    List<Brand> brands = new List<Brand>();
    jsonMapList.forEach((jsonMap) {
      brands.add(Brand.fromJson(jsonMap));
    });
    return brands;
  }
}
