import 'package:flutter/material.dart';

class TextConstant{
  static TextConstant instance = TextConstant._init();
  TextConstant._init();

  final text8Bold = TextStyle(fontSize: 8,fontWeight: FontWeight.bold);
  final text14Bold = TextStyle(fontSize: 14,fontWeight: FontWeight.bold);
  final text16Bold = TextStyle(fontSize: 16,fontWeight: FontWeight.bold);
  final text20Bold = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
  final text24Bold = TextStyle(fontSize: 24,fontWeight: FontWeight.bold);
  final text12Grey = TextStyle(fontSize: 12,color:Colors.grey[600]);
  final text14Grey = TextStyle(fontSize: 14,color:Colors.grey[600]);
  final text16Grey = TextStyle(fontSize: 16,color:Colors.grey[600]);
 final text16Opacity = TextStyle(fontSize: 16,color: Colors.grey[600]);

  final textStyle = TextStyle(color: Colors.black);
}