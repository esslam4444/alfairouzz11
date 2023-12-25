class LoginVM {
  late final String password;
  late final bool? rememberMe;
  late final String username;

  LoginVM({required this.username, required this.password, this.rememberMe});

  LoginVM.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    rememberMe = json['rememberMe'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['password'] = password;
    _data['rememberMe'] = rememberMe;
    _data['username'] = username;

    return _data;
  }
}
