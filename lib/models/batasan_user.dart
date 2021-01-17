class BatasanUser {
  final String id;
  final String email;

  BatasanUser({this.id, this.email});

  BatasanUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
