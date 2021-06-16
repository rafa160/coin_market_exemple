class PlatformModel {
  int id;
  String name;
  String symbol;
  String slug;
  String token;

  PlatformModel({this.id, this.name, this.symbol, this.slug, this.token});

  PlatformModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    symbol = json["symbol"];
    slug = json["slug"];
    token = json["token_address"];
  }
}