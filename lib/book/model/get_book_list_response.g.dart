// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_book_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookListResponse _$GetBookListResponseFromJson(Map<String, dynamic> json) =>
    GetBookListResponse(
      items: DataUtils.volumeInfoToItems(
          DataUtils.readItems(json, 'items') as List),
    );

Map<String, dynamic> _$GetBookListResponseToJson(
        GetBookListResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
