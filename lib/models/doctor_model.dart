class DoctorModel {
  final String name;
  final String professional;
  final String image;
  final double stars;
  final String description;
  final List<String>? contact;
  final List<String>? comments;

  DoctorModel({
    required this.name,
    required this.professional,
    required this.image,
    required this.stars,
    required this.description,
    this.comments,
    this.contact,
  });
}
