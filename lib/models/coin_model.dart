import 'package:coin_market/models/platform_model.dart';

class CoinModel {

  int id;
  String name;
  String symbol;
  String slug;
  int rank;
  int isActive;
  PlatformModel platformModel;
  DateTime firstHistoricalData;
  DateTime lastHistoricalData;

  CoinModel({this.id, this.name, this.symbol, this.slug, this.rank,
      this.isActive, this.firstHistoricalData, this.lastHistoricalData, this.platformModel});

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    rank: json["rank"],
    isActive: json["is_active"],
    firstHistoricalData: json["first_historical_data"] == null ? null : DateTime.parse(json["first_historical_data"]),
    lastHistoricalData: json["last_historical_data"] == null ? null : DateTime.parse(json["last_historical_data"]),
    platformModel: json["platform"] != null ? new PlatformModel.fromJson(json["platform"]) : null,
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "rank": rank,
        "is_active": isActive,
        "first_historical_data": firstHistoricalData,
        "last_historical_data": lastHistoricalData,
      };
}