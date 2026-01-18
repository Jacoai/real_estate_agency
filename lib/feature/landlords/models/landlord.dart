class Landlord {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? adress;

  Landlord({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.adress,
  });
}
