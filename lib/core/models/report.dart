class Report {
  final String subject;
  final String title;
  final String message;
  final String author;
  final String id;
  final bool isAnonymous;
  final DateTime date;

  const Report({
    required this.author,
    required this.date,
    required this.message,
    required this.subject,
    required this.title,
    required this.id,
    required this.isAnonymous,
  });

  factory Report.fromJSON(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      subject: json['subject'],
      title: json['title'],
      message: json['message'],
      author: json['author'],
      isAnonymous: json['is_anonymous'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subject': subject,
        'title': title,
        'message': message,
        'author': author,
        'id': id,
        'is_anonymous': isAnonymous,
        'date': date.millisecondsSinceEpoch,
      };
}
