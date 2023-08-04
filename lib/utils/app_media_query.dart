import 'package:flutter/material.dart';

class AppMediaQuery {
  static height(context) {
    return MediaQuery.sizeOf(context).height;
  }
    static width(context) {
    return MediaQuery.sizeOf(context).width;
  }
}
