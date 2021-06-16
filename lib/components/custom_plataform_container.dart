import 'package:coin_market/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPlatformContainer extends StatelessWidget {

  final String name;
  final String symbol;
  final String slug;
  final String token;

  const CustomPlatformContainer({Key key, this.name, this.symbol, this.slug, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.grey[100],
            Colors.grey[200],
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style:platformDetailsScreenBlack,),
            SizedBox(
              height: 20,
            ),
            Text(slug, style:platformDetailsScreenBlack,),
            SizedBox(
              height: 20,
            ),
            Text(symbol,style:platformDetailsScreenBlack,),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Token',style:platformDetailsScreenBlack,),
            ),
            Center(child: Text(token)),
          ],
        ),
      ),
    );
  }
}
