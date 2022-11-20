import 'package:book_store_riverpod/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part "book_model.g.dart";

@JsonSerializable()
class BookModel {
  @JsonKey(
    defaultValue: "",
  )
  final String title;
  @JsonKey(
    defaultValue: "",
  )
  final String subtitle;
  @JsonKey(
    readValue: DataUtils.readThumbnail,
    defaultValue: "https://i.ibb.co/2ypYwdr/no-photo.png",
  )
  final String thumbnail;
  @JsonKey(
    defaultValue: "",
  )
  final String previewLink;

  BookModel({
    required this.title,
    required this.subtitle,
    required this.thumbnail,
    required this.previewLink,
  });

  // flutter pub run build_runner watch --delete-conflicting-outputs
  // book_model.g.dart 만들어 줌

  factory BookModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
