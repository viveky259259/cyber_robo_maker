import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginState extends Equatable {}

class InitState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginCompleted extends LoginState {
  final String token;
  final int userId;

  LoginCompleted({@required this.userId, @required this.token});

  @override
  List<Object> get props => [this.token, this.userId];
}
