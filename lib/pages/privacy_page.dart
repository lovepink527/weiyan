import 'package:flutter/material.dart';
import 'package:weiyan/widget/head_widget.dart';


class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Head(title: '隐私设置'),
          ],
        )
      );
  }
}