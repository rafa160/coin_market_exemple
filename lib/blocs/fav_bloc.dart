
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:coin_market/components/custom_toast.dart';
import 'package:coin_market/models/coin_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc extends BlocBase {

  Map<String, CoinModel> favoritesCoins = {};

  final _favController = BehaviorSubject<Map<String, CoinModel>>();
  Stream<Map<String, CoinModel>> get outFav => _favController.stream;


  void toggleAsFavorite(CoinModel model) {
    if (favoritesCoins.containsKey(model.name)) {
      CustomToast.fail('Coin is already in the Fav List or Cant be add');
    } else {
      CustomToast.success('Coin added to Fav.');
      _setUpFavoriteStream(model);
      _saveFavorite();
    }
  }

  void _setUpFavoriteStream(CoinModel model) {
    favoritesCoins[model.name] = model;
    _favController.sink.add(favoritesCoins);
  }

  void _saveFavorite() {
    _setCoinsOnSharedPreference(
        'coins', favoritesCoins);
  }

  _setCoinsOnSharedPreference(String item, Map<String, CoinModel> value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('coins',json.encode(CoinModel.fromJson(value)));
    });
  }

  @override
  void dispose() {
    _favController.close();
    super.dispose();
  }


}