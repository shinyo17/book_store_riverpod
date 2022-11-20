// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_book_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookListParams _$GetBookListParamsFromJson(Map<String, dynamic> json) =>
    GetBookListParams(
      q: json['q'] as String?,
      startIndex: json['startIndex'] as int?,
      maxResults: json['maxResults'] as int?,
    );

Map<String, dynamic> _$GetBookListParamsToJson(GetBookListParams instance) =>
    <String, dynamic>{
      'q': instance.q,
      'startIndex': instance.startIndex,
      'maxResults': instance.maxResults,
    };
