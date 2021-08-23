class Contact {
  String id;
  String username;
  String phoneNumber;

  Contact({this.id, this.username, this.phoneNumber});

  Contact.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      username = json['username'],
      phoneNumber = json['phone_number'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'username' : username,
    'phone_number' : phoneNumber,
  };
}