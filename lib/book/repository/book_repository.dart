import 'package:book_store_riverpod/book/model/book_model.dart';
import 'package:book_store_riverpod/book/model/get_book_list_params.dart';
import 'package:book_store_riverpod/book/model/get_book_list_response.dart';
import 'package:book_store_riverpod/common/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
part 'book_repository.g.dart';

final bookRepositoryProvider = Provider<BookRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return BookRepository(dio,
      baseUrl: "https://www.googleapis.com/books/v1/volumes");
});

@RestApi()
abstract class BookRepository {
  factory BookRepository(Dio dio, {String baseUrl}) = _BookRepository;

  @GET("/")
  Future<GetBookListResponse> getBookList({
    @Queries() GetBookListParams? getBookListParams = const GetBookListParams(),
  });

  // @GET("/basket")
  // @Headers({
  //   "accessToken": "true",
  // })
  // Future<List<BasketItemModel>> getBasket();

  // @PATCH("/basket")
  // @Headers({
  //   "accessToken": "true",
  // })
  // Future<List<BasketItemModel>> patchBasket({
  //   @Body() required PatchBasketBody body,
  // });
}
