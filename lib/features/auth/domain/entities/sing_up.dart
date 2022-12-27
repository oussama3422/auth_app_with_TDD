import 'package:equatable/equatable.dart';

class SingUp extends Equatable{
  final String? token;

  const SingUp(this.token);
  
  @override
  List<Object?> get props => [token];

}