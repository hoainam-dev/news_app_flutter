class Users{
  String? email;
  String? name;
  String? phone;
  String? userPhotoURL;

  Users({this.email, this.name, this.phone});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
    };
  }

  Users.fromMap(Map<String, dynamic> userMap)
      : email = userMap["email"],
        name = userMap["name"],
        phone = userMap["phone"];
}