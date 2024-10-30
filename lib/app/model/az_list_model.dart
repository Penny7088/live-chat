import 'package:flutter/material.dart';

class AzListModel<T> {
  final String section;
  final List<T> names;

  AzListModel({
    required this.section,
    required this.names,
  });
}

class AzListCursorInfoModel {
  final String title;
  final Offset offset;

  AzListCursorInfoModel({
    required this.title,
    required this.offset,
  });
}