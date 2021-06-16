import 'package:coin_market/helpers/style.dart';
import 'package:coin_market/helpers/utils.dart';
import 'package:coin_market/screens/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var coinBloc = HomeModule.to.getBloc<CoinBloc>();

  @override
  void initState() {
    coinBloc.fetch();
    super.initState();
  }

  // just to use util and show how to works on the test
  final name = splitName('coins list');

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            name,
            style: homeScreenTitle,
          ),
        ),
      ),
    );
  }

  Future refresh() async {
    await Future.delayed(Duration(seconds: 3));
    await coinBloc.fetch();
    return;
  }

}
