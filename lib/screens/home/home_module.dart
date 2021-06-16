import 'package:coin_market/blocs/coin_bloc.dart';
import 'package:coin_market/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';


class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => CoinBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => HomeScreen();

  static Inject get to => Inject<HomeModule>.of();
}
