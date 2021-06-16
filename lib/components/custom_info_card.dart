import 'package:coin_market/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInfoCard extends StatelessWidget {

  final String titleOne;
  final String titleTwo;

  const CustomInfoCard({Key key, this.titleOne, this.titleTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight * 0.2,
      width: ScreenUtil.screenWidth * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black,
            Colors.grey,
          ],
        ),
      ),
      child: Card(
        elevation: 8,
        color: Colors.black38,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Flexible(child: Text(titleOne, style: infoCardTitle,)),
            SizedBox(
              height: 15,
            ),
            Flexible(child: Text(titleTwo, style: infoCardSub,)),
          ],
        ),
      ),
    );
  }
}
