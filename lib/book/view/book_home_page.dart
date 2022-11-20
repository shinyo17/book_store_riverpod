import 'package:book_store_riverpod/book/model/book_model.dart';
import 'package:book_store_riverpod/book/provider/book_provider.dart';
import 'package:book_store_riverpod/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BookHomePage extends ConsumerWidget {
  BookHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider);
    return DefaultLayout(
      appBar: _AppBar(),
      child: books.isEmpty ? const _WhenListIsEmpty() : const _BookListView(),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  _AppBar({super.key});

  final TextEditingController searchController = TextEditingController();

  /// 검색 함수
  /// 엔터를 누르거나 돋보기 아이콘을 누를 때 호출
  void search(WidgetRef ref) {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      ref.watch(bookProvider.notifier).getBookList(keyword);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider);
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        "Book Store",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "total ${books.length}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],

      /// AppBar의 Bottom은 항상 PreferredSize 위젯으로 시작해야합니다.
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 72),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "원하시는 책을 검색해주세요.",
              // 테두리
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),

              /// 돋보기 아이콘
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // 돋보기 아이콘 클릭
                  search(ref);
                },
              ),
            ),
            onSubmitted: (v) {
              // 엔터를 누르는 경우
              search(ref);
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 72);
}

class _WhenListIsEmpty extends StatelessWidget {
  const _WhenListIsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "검색어를 입력해 주세요",
        style: TextStyle(
          fontSize: 21,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _BookListView extends ConsumerWidget {
  const _BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider);
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        BookModel book = books[index];
        return _BookWidget(book: book);
      },
    );
  }
}

class _BookWidget extends StatelessWidget {
  const _BookWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        book.thumbnail,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
      title: Text(book.title),
      subtitle: Text(book.subtitle),
      onTap: () {
        launchUrlString(book.previewLink);
      },
    );
  }
}
