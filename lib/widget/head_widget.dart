import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  final String title;
  const Head({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: double.infinity,
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_backspace,
                    size: 30,
                    color: Colors.black45,
                  )),
              Text(title ,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      decoration: TextDecoration.none))
            ]));
  }
}
