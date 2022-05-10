// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      author: json['author'] as String,
      date: DateTime.parse(json['date'] as String),
      message: json['message'] as String,
      subject: json['subject'] as String,
      title: json['title'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'subject': instance.subject,
      'title': instance.title,
      'message': instance.message,
      'author': instance.author,
      'id': instance.id,
      'date': instance.date.toIso8601String(),
    };
