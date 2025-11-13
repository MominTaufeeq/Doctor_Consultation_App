class Doctor {
  final String name;
  final String specialization;
  final double rating;

  Doctor({
    required this.name,
    required this.specialization,
    required this.rating,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      rating: json['rating'].toDouble(),
    );
  }
}
