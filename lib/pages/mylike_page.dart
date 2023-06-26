import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weiyan/widget/head_widget.dart';
import 'package:weiyan/routers/routers.dart';
import 'package:weiyan/constant/constant.dart';

class MyLikePage extends StatefulWidget {
  const MyLikePage({super.key});

  @override
  State<MyLikePage> createState() => _MyLikePageState();
}

class _MyLikePageState extends State<MyLikePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Head(title: '❤️'), 
            MyLikeList(),],
        ));
  }
}

class MyLikeList extends StatefulWidget {
  const MyLikeList({super.key});

  @override
  State<MyLikeList> createState() => _MyLikeListState();
}

class _MyLikeListState extends State<MyLikeList> {
  List<Map> _list = []; //测试数据

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      //for循环添加10条数据
      _list.add({
        "author": '姜慧慧' + i.toString(),
        "text":
            "世上只有一种英雄主义，就是在认清生活真相之后依然热爱生活。世上只有一种英雄主义，就是在认清生活真相之后依然热爱生活。世上只有一种英雄主义，就是在认清生活真相之后依然热爱生活。" + i.toString()
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Routes.navigateTo(context, '${Routes.likedetailPage}');
                },
                child: Card(
                elevation: 20, //设置卡片阴影的深度
                shape: RoundedRectangleBorder(
                  //设置卡片圆角
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10), //设置卡片外边距
                child: Column(
                  children: [
                    ListTile(
                      leading: ClipRRect( //剪裁为圆角矩形
                        borderRadius: BorderRadius.circular(5.0),
                        child:Image.asset(Constant.ASSETS_IMG + 'welcome_android_slogan.png', width: 60.0)
                      ),
                      title: Text(_list[index]["text"],
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              decoration: TextDecoration.none)),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                        '——' + _list[index]["author"],
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        )),
                      )
                    )
                  ],
                ),
              ),
              );
            }));
  }
}
