import 'package:flutter/material.dart';

class IconConstant{
  static IconConstant instance = IconConstant._init();
  IconConstant._init();

  final iconSizeS = 16.0;
  final iconSizeM = 20.0;
  final iconSizeL = 24.0;

  final navBarButtonSelectedIcon = IconThemeData(color: Colors.blue[700],size: 30);
  final navBarButtonUnselectedIcon = IconThemeData(color: Colors.grey.shade600);

}