import 'package:flutter/material.dart';

class PaddingConstant{
  static PaddingConstant instance = PaddingConstant._init();
  PaddingConstant._init();

  
  final paddingNone = const EdgeInsets.all(0);
  final paddingAll8 = const EdgeInsets.all(8);
  final paddingAll16 = const EdgeInsets.all(16);
  final paddingTop8 = const EdgeInsets.only(top: 8);
  final paddingTop16 = const EdgeInsets.only(top: 16);
  final paddingLeft8 = const EdgeInsets.only(left:10);
  final paddingLeft10 = const EdgeInsets.only(left:8);
  final paddingLeft16 = const EdgeInsets.only(left:16);
  final paddingLeft35 = const EdgeInsets.only(left:35.0);
  final paddingSymmetric10 = const EdgeInsets.symmetric(horizontal: 10);
  final marginBottom20 = const EdgeInsets.only(bottom: 20);
  final marginBottom10 = const EdgeInsets.only(bottom: 10);

}