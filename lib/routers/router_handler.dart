import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:weiyan/pages/index_page.dart';
import 'package:weiyan/pages/setting_page.dart';
import 'package:weiyan/pages/privacy_page.dart';
import 'package:weiyan/pages/mylike_page.dart';
import 'package:weiyan/pages/feedback_page.dart';
import 'package:weiyan/pages/likedetail_page.dart';

var indexPageHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return IndexPage();
});

var settingPageHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SettingPage();
});

var PrivacyPageHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return PrivacyPage();
});

var MyLikePageHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MyLikePage();
});

var FeedBackPageHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return FeedBackPage();
});

var LikeDetailPageHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LikeDetailPage();
});