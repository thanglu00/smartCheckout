part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class AuthenticationSuccess extends AuthenticationState {
  final String displayName;
  final String email;
  const AuthenticationSuccess(this.displayName,this.email);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class AuthenticationFailure extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}

class AuthenticationPhone extends AuthenticationState{
  @override
  String toString() => 'Unauthenticated';
}