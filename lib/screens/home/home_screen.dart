import 'package:coin_market/blocs/coin_bloc.dart';
import 'package:coin_market/components/custom_circular_progress_indicator.dart';
import 'package:coin_market/components/custom_info_card.dart';
import 'package:coin_market/components/custom_reload_button.dart';
import 'package:coin_market/helpers/style.dart';
import 'package:coin_market/helpers/utils.dart';
import 'package:coin_market/models/coin_model.dart';
import 'package:coin_market/screens/coin_details/coin_details_module.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: coinBloc.fetch(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return CustomCircularProgressIndicator();
                        default:
                          if (!snapshot.hasData || snapshot.hasError) {
                            return Center(
                                child: Column(
                                   children: [
                                    Text('Sorry something went wrong'),
                                    CustomButton(
                                      text: 'reload',
                                      onPressed: () async {
                                        Get.offAll(() => HomeModule());
                                  },
                                ),
                              ],
                            ));
                          }
                          return Container(
                            color: Colors.white,
                            height: ScreenUtil.screenHeight,
                            child: RefreshIndicator(
                              onRefresh: refresh,
                              backgroundColor: Colors.black,
                              color: Colors.white,
                              child: GridView.builder(
                                      padding: EdgeInsets.all(2),
                                      shrinkWrap: true,
                                      itemCount: coinBloc.coins.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8,
                                        childAspectRatio: 2 / 2.6,
                                      ),
                                      itemBuilder: (BuildContext context, int index) {
                                        CoinModel coin = snapshot.data[index];
                                        return GestureDetector(
                                          onTap: () async {
                                            Get.to(() => CoinDetailsModule(coinModel: coin,));
                                          },
                                          child: CustomInfoCard(
                                            titleOne: coin.name,
                                            titleTwo: coin.symbol,
                                          ),
                                        );
                                      }
                                  ),
                            ),
                          );
                      }
                    }
                ),
              ],
            ),
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
