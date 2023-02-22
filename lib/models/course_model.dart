class CourseModel {
  final String title;
  final String description;
  final DateTime created;
  final String imageUrl;

  CourseModel({
    required this.created,
    required this.description,
    required this.title,
    required this.imageUrl,
  });
}
