import 'package:ecook/modules/home/reecookdetail.dart';import 'package:ecook/modules/search/research.dart';import 'package:flutter/material.dart';class ReRoute {  //跳转到搜索页  static presentToSearchVC(BuildContext context) {    Navigator.push(context, MaterialPageRoute(      fullscreenDialog: true,      builder: (context) {        return NewSearch();      }    ),);  }  //菜谱详情  static presentToEcookDetailVC(BuildContext context) {    Navigator.push(context, MaterialPageRoute(        fullscreenDialog: true,        builder: (context) {          return DetaileEcook();        }    ),);  }}