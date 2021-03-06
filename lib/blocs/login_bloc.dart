import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fashion_connect/blocs/blocs.dart';
import 'package:fashion_connect/models/models.dart';
import 'package:fashion_connect/repositories/repositories.dart';
import 'package:meta/meta.dart';

// LOGIN STATES
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error}) : super([error]);

  @override
  String toString() => '{ error: $error }';
}

// LOGIN EVENTS
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final AuthMode authMode;

  LoginButtonPressed(
      {@required this.username,
      @required this.password,
      @required this.authMode})
      : super([username, password, authMode]);

  @override
  String toString() =>
      '{ username: $username, password: $password, authMode: ${authMode.toString} }';
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  final AuthRepository authRepository;

  LoginBloc({@required this.authBloc, @required this.authRepository})
      : assert(authBloc != null),
        assert(authRepository != null);

  @override
  LoginState get initialState => LoginInitial();

  void onLoginButtonPressed(
      {@required String username,
      @required String password,
      @required AuthMode authMode}) {
    dispatch(LoginButtonPressed(
        username: username, password: password, authMode: authMode));
  }

  @override
  Stream<LoginState> mapEventToState(
      LoginState currentState, LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final String userToken = await authRepository.authenticate(
            authMode: event.authMode,
            username: event.username,
            password: event.password);

        print(userToken);

        final _user = User(
            uid: event.password,
            username: event.username,
            imageUrl: 'imageUrl',
            userRight: 'admin');

        authBloc.onLoggedIn(user: _user, authMode: event.authMode);
        yield LoginInitial();
      } catch (e) {
        yield LoginFailure(error: e.toString());
      }
    }
  }
}
