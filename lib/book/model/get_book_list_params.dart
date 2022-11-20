import 'package:json_annotation/json_annotation.dart';

part 'get_book_list_params.g.dart';

@JsonSerializable()
class GetBookListParams {
  final String? q;
  final int? startIndex;
  final int? maxResults;

  const GetBookListParams({
    this.q,
    this.startIndex,
    this.maxResults,
  });

  factory GetBookListParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GetBookListParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookListParamsToJson(this);
}
