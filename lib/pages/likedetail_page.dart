import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weiyan/widget/head_widget.dart';
import 'package:weiyan/widget/textitem_widget.dart';

class LikeDetailPage extends StatefulWidget {
  const LikeDetailPage({super.key});

  @override
  State<LikeDetailPage> createState() => _LikeDetailPageState();
}

class _LikeDetailPageState extends State<LikeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Head(title: '详情'),
            Expanded(child: TextItem())
          ],
        ));
  }
}
