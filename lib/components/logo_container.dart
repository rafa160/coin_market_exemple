import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {

  final String tag;

  const LogoContainer({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.fill,
        scale: 0.5,
      ),
    );
  }
}