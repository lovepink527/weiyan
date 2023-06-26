import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weiyan/widget/head_widget.dart';
import 'package:weiyan/widget/foot_widget.dart';
import 'package:weiyan/routers/routers.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Head(title: '设置'),
            Expanded(child: SettingContent()),
            Foot()
          ],
        ));
  }
}

class SettingContent extends StatelessWidget {
  const SettingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: InkWell(
                onTap: () {
                  Routes.navigateTo(context, '${Routes.myLikePage}');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('我的点赞',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                decoration: TextDecoration.none)),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 25,
                    )
                  ],
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: InkWell(
                  onTap: () {
                    print('当前版本');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.update_outlined,
                            color: Colors.black54,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('当前版本',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('1.0.0',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black26,
                                  decoration: TextDecoration.none)),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 25,
                      )
                    ],
                  ))),
          Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: InkWell(
                onTap: () {
                  Routes.navigateTo(context, '${Routes.privacyPage}');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.privacy_tip_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('隐私设置',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                decoration: TextDecoration.none)),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 25,
                    )
                  ],
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: InkWell(
                  onTap: () {
                    Routes.navigateTo(context, '${Routes.feedbackPage}');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.feedback_outlined,
                            color: Colors.black54,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('投诉反馈',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none)),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 25,
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}

