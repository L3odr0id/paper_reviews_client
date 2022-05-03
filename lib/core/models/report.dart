import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  final String subject;
  final String title;
  final String message;
  final String author;
  final DateTime date;

  const Report({
    required this.author,
    required this.date,
    required this.message,
    required this.subject,
    required this.title,
  });

  factory Report.fromJSON(Map<String, dynamic> json) {
    return Report(
      subject: json['subject'],
      title: json['title'],
      message: json['message'],
      author: json['author'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
