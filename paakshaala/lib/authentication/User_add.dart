class User {
  final String username;
  final int mailid;

  User({required this.username, required this.mailid});

  dynamic toJson() => {
        'id': DateTime.now().toString(),
        'Username': username,
        'mailid': mailid.toString()
      };
}
