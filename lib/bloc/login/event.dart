import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class InitLogin extends LoginEvent {
  final String mobileNum;

  InitLogin(this.mobileNum);

  @override
  List<Object> get props => [mobileNum];
}
