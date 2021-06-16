import 'package:coin_market/components/custom_plataform_container.dart';
import 'package:coin_market/helpers/style.dart';
import 'package:coin_market/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoinDetailsScreen extends StatefulWidget {
  final CoinModel coinModel;

  const CoinDetailsScreen({Key key, this.coinModel}) : super(key: key);

  @override
  _CoinDetailsScreenState createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
           'details screen'.toUpperCase(),
            style: detailsTitle,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: ScreenUtil.screenHeight,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '${widget.coinModel.name} - ${widget.coinModel.symbol}',
                          style: infoDetailsScreen),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Dates', style: infoDetailsScreenBlack,),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'First ${widget.coinModel.firstHistoricalData.month}-${widget.coinModel.firstHistoricalData.day}-${widget.coinModel.firstHistoricalData.year}',
                            style: dateDetailsScreen,
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Text(
                            'Last ${widget.coinModel.lastHistoricalData.month}-${widget.coinModel.lastHistoricalData.day}-${widget.coinModel.lastHistoricalData.year}',
                            style: dateDetailsScreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Text('Plataform', style: infoDetailsScreenBlack,),
                  SizedBox(
                    height: 20,
                  ),
                  widget.coinModel.platformModel != null ? CustomPlatformContainer(
                    name: widget.coinModel.platformModel.name,
                    slug: widget.coinModel.platformModel.slug,
                    symbol: widget.coinModel.platformModel.symbol,
                    token: widget.coinModel.platformModel.token,
                  ) : Text('There is not Plataform Infos here...', style: infoDetailsScreen,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
