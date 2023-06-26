import 'package:flutter/material.dart';
import 'package:weiyan/constant/constant.dart';
import 'package:weiyan/public.dart';

class HeadWidget extends StatefulWidget {
  String mTitle;

  HeadWidget(this.mTitle);

  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 50,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          child: GestureDetector(
                              onTapDown: _handleTapDown,
                              // Handle the tap events in the order that
                              onTapUp: _handleTapUp,
                              // they occur: down, up, tap, cancel
                              onTap: () {
                                //  Navigator.pop(context);
                              },
                              onTapCancel: _handleTapCancel,
                              child: new IconButton(
                  icon: new Image.asset("assets/images/ic_main_add.png",
                      width: 40.0, height: 40.0),
                  onPressed: () {
                    // Routes.navigateTo(context, '${Routes.weiboPublishPage}');
                  },
                ),))),
                ],
              ),
            ),
            ),
        // Container(
        //   color: Color(0xffE6E4E3),
        //   height: 0.5,
        // )
      ],
    );
  }
}
