import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:coin_market/app_widget.dart';
import 'package:flutter/material.dart';


class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}