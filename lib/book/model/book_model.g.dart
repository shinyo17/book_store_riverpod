// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      thumbnail: DataUtils.readThumbnail(json, 'thumbnail') as String? ??
          'https://i.ibb.co/2ypYwdr/no-photo.png',
      previewLink: json['previewLink'] as String? ?? '',
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'thumbnail': instance.thumbnail,
      'previewLink': instance.previewLink,
    };
