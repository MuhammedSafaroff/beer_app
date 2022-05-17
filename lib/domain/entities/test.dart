import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String token;
  final String name;

  const LoginResponse({
    required this.token,
    required this.name,
  });

  @override
  List<Object?> get props => [token, name];
}
