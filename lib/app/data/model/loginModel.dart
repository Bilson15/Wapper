class LoginModel {
  LoginModel({
    required this.email,
    required this.senha,
  });
  late final String email;
  late final String senha;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['senha'] = senha;
    return _data;
  }
}
