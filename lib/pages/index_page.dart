import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weiyan/util/toast_util.dart';

import 'home_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late DateTime lastPopTime;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        child: Scaffold(
          backgroundColor: Color(0xFF69c5df),
          body: HomePage()
        ),
          onWillPop: ()   {
          // 点击返回键的操作
          if (lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
            lastPopTime = DateTime.now();
            ToastUtil.show('再按一次退出应用');
          } else {
            lastPopTime = DateTime.now();
            // 退出app
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
          return Future(() => true);
        },
      ),
    );
  }
}