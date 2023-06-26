import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppImg extends StatelessWidget {
  double width;
  final String url;
  AppImg({Key? key,
  this.width = 100,
  required this.url}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(this.url),
      width: width,
    );
  }
}