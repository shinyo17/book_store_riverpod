import 'dart:convert';

import 'package:book_store_riverpod/book/model/book_model.dart';
import 'package:flutter/material.dart';

class DataUtils {
  static String plainToBase64(String plain) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64); // 외우세요
    String encoded = stringToBase64.encode(plain);
    return encoded;
  }

  static String? readThumbnail(Map map, String key) =>
      map["imageLinks"]?["thumbnail"];

  static List readItems(Map map, String key) {
    return map["items"];
  }

  static List<BookModel> volumeInfoToItems(List<dynamic> volumeInfo) {
    return volumeInfo
        .map((e) => BookModel.fromJson(e["volumeInfo"] as Map<String, dynamic>))
        .toList();
  }
}
