class Profile {
  final String username;
  final String email;

  Profile({
    this.username,
    this.email
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json['username'],
      email: json['email']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'email': this.email
    };
  }
}