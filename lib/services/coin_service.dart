

import 'package:coin_market/models/coin_model.dart';
import 'package:coin_market/networking/web_api_base.dart';
import 'package:coin_market/services/coin_market_api.dart';

class CoinService extends WebApiBase {

  Future<List<CoinModel>> getCoins() async {
    var result = await get(
        controller:
        '${CoinMarketApi.apiVersion}${CoinMarketApi.coins}${CoinMarketApi.map}${CoinMarketApi.apiKeyParam}${CoinMarketApi.key}');
    return result.dataList.map<CoinModel>((map) {
      var coins = CoinModel.fromJson(map);
      return coins;
    }).toList();
  }

}