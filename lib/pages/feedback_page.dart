import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weiyan/widget/head_widget.dart';
import 'package:weiyan/widget/foot_widget.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('投诉与反馈',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  decoration: TextDecoration.none)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54, opacity: 1, size: 30),
        ),

        /// 这里必须禁止重绘
        body: SingleChildScrollView(
            reverse: true,
            child: SizedBox(
              /// 这里根据页面的情况来得到一个高度
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 50, bottom: 50),
                      child: FeedBackContent())
                ],
              ),
            )));
  }
}

class FeedBackContent extends StatefulWidget {
  const FeedBackContent({super.key});

  @override
  State<FeedBackContent> createState() => _FeedBackContentState();
}

class _FeedBackContentState extends State<FeedBackContent> {
  TextEditingController _suggestionController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  //输入框控制器，一般用于获取文本、修改文本等
  TextEditingController _inputController = TextEditingController();
//焦点节点，一般用于自动获取焦点，取消焦点以便隐藏键盘等
  FocusNode _inputFocusNode = FocusNode();
//边框样式
  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Color.fromARGB(255, 240, 238, 238),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              fillColor: Colors.grey[50], //背景颜色，必须结合filled: true,才有效
              filled: true, //重点，必须设置为true，fillColor才有效
              isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 10), //内容内边距，影响高度
              border: _outlineInputBorder,
              focusedBorder: _outlineInputBorder,
              enabledBorder: _outlineInputBorder,
              disabledBorder: _outlineInputBorder,
              focusedErrorBorder: _outlineInputBorder,
              errorBorder: _outlineInputBorder,
              hintText: "请输入您的联系方式",
            ),
            // keyboardType: TextInputType.number, //键盘类型
            //校验密码
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "联系方式不能为空";
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            focusNode: myFocusNode,
            autofocus: true,
            maxLines: 10,
            maxLength: 200,
            controller: _suggestionController,
            decoration: InputDecoration(
              fillColor: Colors.grey[50], //背景颜色，必须结合filled: true,才有效
              filled: true, //重点，必须设置为true，fillColor才有效
              isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 10), //内容内边距，影响高度
              border: _outlineInputBorder, //边框，一般下面的几个边框一起设置
              focusedBorder: _outlineInputBorder,
              enabledBorder: _outlineInputBorder,
              disabledBorder: _outlineInputBorder,
              focusedErrorBorder: _outlineInputBorder,
              errorBorder: _outlineInputBorder,
              hintText: "请输入您的建议",
            ),
            // obscureText: true,
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "意见不能为空";
            },
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              child: Container(
                // margin: EdgeInsets.only(left: 20),
                width: 335,
                height: 48,
                decoration: BoxDecoration(
                    // color: Colors.black26,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(90))),
                child: Center(
                  child: Text('提交', style: TextStyle(color: Colors.black54)),
                ),
              ),
              onTap: () {
                if ((_formKey.currentState as FormState).validate()) {
                  //验证通过提交数据
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
