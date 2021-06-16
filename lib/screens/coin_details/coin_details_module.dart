import 'package:coin_market/blocs/fav_bloc.dart';
import 'package:coin_market/models/coin_model.dart';
import 'package:coin_market/screens/coin_details/coin_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CoinDetailsModule extends ModuleWidget {

  final CoinModel coinModel;

  CoinDetailsModule({this.coinModel});

  @override
  List<Bloc> get blocs => [
    Bloc((i) => FavoriteBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => CoinDetailsScreen(coinModel: coinModel,);

  static Inject get to => Inject<CoinDetailsModule>.of();
}
