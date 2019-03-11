import 'package:equatable/equatable.dart';
import 'package:fashion_connect/models/models.dart';
import 'package:fashion_connect/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

// AUTHETICATION STATES
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  final AuthMode authMode;

  AuthAuthenticated({@required this.authMode}) : super([authMode]);

  @override
  String toString() => 'AuthAuthenticated: { authMode: $authMode }';
}

class AuthUnauthenticated extends AuthState {
  @override
  String toString() => 'AuthUnauthenticated';
}

class AuthLoading extends AuthState {
  @override
  String toString() => 'AuthLoading';
}

// AUTHENTICATION EVENTS
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final User user;
  final AuthMode authMode;

  LoggedIn({@required this.user, @required this.authMode})
      : super([user, authMode]);

  @override
  String toString() =>
      '{ user: ${user.toString()}, authMode: ${authMode.toString} }';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}

// AUTHENTICATION BLOC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({@required this.authRepository}) : assert(authRepository != null);

  @override
  AuthState get initialState => AuthUninitialized();

  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLoggedIn({@required User user, @required AuthMode authMode}) {
    dispatch(LoggedIn(user: user, authMode: authMode));
  }

  void onLoggedOut() {
    dispatch(LoggedOut());
  }

  @override
  Stream<AuthState> mapEventToState(
      AuthState currentState, AuthEvent event) async* {
    if (event is AppStarted) {
      final bool isAuthenticated = await authRepository.isAuthenticated();

      if (isAuthenticated) {
        yield AuthAuthenticated(authMode: AuthMode.SignUp);
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthLoading();

      await authRepository.persistUser(user: event.user);
      yield AuthAuthenticated(authMode: event.authMode);
    }

    if (event is LoggedOut) {
      yield AuthLoading();

      await authRepository.signout();
      yield AuthUnauthenticated();
    }
  }
}
