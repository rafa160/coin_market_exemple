
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:coin_market/models/coin_model.dart';
import 'package:coin_market/services/coin_service.dart';

class CoinBloc extends BlocBase {
  List coins = [];
  CoinService _coinService = CoinService();

  Future<List<CoinModel>> fetch() async {
    coins = await _coinService.getCoins();
    return coins;
  }

}