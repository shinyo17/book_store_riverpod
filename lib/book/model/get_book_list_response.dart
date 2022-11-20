import 'package:book_store_riverpod/book/model/book_model.dart';
import 'package:book_store_riverpod/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_book_list_response.g.dart';

@JsonSerializable()
class GetBookListResponse {
  @JsonKey(
    readValue: DataUtils.readItems,
    fromJson: DataUtils.volumeInfoToItems,
  )
  final List<BookModel> items;

  GetBookListResponse({
    required this.items,
  });

  factory GetBookListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookListResponseFromJson(json);
}
