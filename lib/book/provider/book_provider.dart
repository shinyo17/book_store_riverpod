import 'package:book_store_riverpod/book/model/book_model.dart';
import 'package:book_store_riverpod/book/model/get_book_list_params.dart';
import 'package:book_store_riverpod/book/repository/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookProvider =
    StateNotifierProvider<BookStateNotifier, List<BookModel>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);
  return BookStateNotifier(
    repository: bookRepository,
  );
});

class BookStateNotifier extends StateNotifier<List<BookModel>> {
  final BookRepository repository;

  BookStateNotifier({
    required this.repository,
  }) : super(
          [],
        );

  /// 검색어로 책 정보 불러오기
  void getBookList(String q) async {
    GetBookListParams params =
        GetBookListParams(q: q, startIndex: 0, maxResults: 40);

    state = [];

    // API 호출

    final resp = await repository.getBookList(getBookListParams: params);

    state = resp.items;
  }
}
