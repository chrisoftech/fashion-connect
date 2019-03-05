import 'package:equatable/equatable.dart';
import 'package:fashion_connect/models/models.dart';
import 'package:fashion_connect/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

// AUTHETICATION STATES
abstract class AuthState extends Equatable {}

class AuthUnInitialized extends AuthState {
  @override
  String toString() => 'AuthUnInitialized';
}

class AuthAuthenticated extends AuthState {
  @override
  String toString() => 'AuthAuthenticated';
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

  LoggedIn({@required this.user}) : super([user]);

  @override
  String toString() => '{ user: ${user.toString()} }';
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
  AuthState get initialState => AuthUnInitialized();

  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLoggedIn({@required User user}) {
    dispatch(LoggedIn(user: user));
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
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthLoading();     

      await authRepository.persistUser(user: event.user);
      yield AuthAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthLoading();

      await authRepository.signout();
      yield AuthUnauthenticated();
    }
  }
}
