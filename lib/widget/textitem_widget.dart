import 'package:flutter/material.dart';

class TextItem extends StatefulWidget {
  const TextItem({super.key});

  @override
  State<TextItem> createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
            // padding: const EdgeInsets.only(top: 70),
            // color: Color(0xFFc5e5f3),
            child: Stack(children: [
              Positioned(
                child: Container(
                    width: width,
                    height: height * 0.7,
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Color(0xFFebf8fd),
                    ),
                    child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width,
                                child: new Text(
                                  '世上只有一种英雄主义，就是在认清生活真相之后依然热爱生活。',
                                  style: TextStyle(
                                      fontSize: 20, 
                                      color: Colors.black54,
                                      fontFamily: 'KaTi',
                                      decoration: TextDecoration.none
                                      ),

                                ),
                              ),
                            ]))),
              ),
              Positioned(
                bottom: 150,
                child: Container(
                  width: width,
                  padding: const EdgeInsets.only(right: 20),
                  child: new Text(
                    '——姜慧慧',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontFamily: 'KaTi',
                      decoration: TextDecoration.none
                      ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                      child: Column(
                        children: [
                          Divider(
                            thickness: 1.0,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LikeButton(like: 1),
                              SizedBox(width: 100),
                              Icon(
                                Icons.ios_share,
                                color: Colors.black54,
                                size: 40,
                              ),
                            ],
                          ),
                        ],
                      )))
            ]),
          );
  }
}

class LikeButton extends StatefulWidget {
  final int? like;
  const LikeButton({
    Key? key,
    this.like,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState(like: this.like);
}

class _LikeButtonState extends State<LikeButton> {
  late int? like;
  _LikeButtonState({this.like});

  Widget likeButton() {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        size: 30,
      ),
      color: Colors.red,
      onPressed: () {
        setState(() {
          this.like = 0;
        });
      },
    );
  }

  Widget unLikeButton() {
    return IconButton(
        icon: Icon(Icons.favorite_border, size: 30),
        color: Colors.black54,
        onPressed: () {
          setState(() {
            this.like = 1;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return this.like == 1 ? likeButton() : unLikeButton();
  }
}
