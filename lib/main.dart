import 'package:bloc/bloc.dart';
import 'package:fashion_connect/blocs/blocs.dart';
import 'package:fashion_connect/modules/modules.dart';
import 'package:fashion_connect/repositories/repositories.dart';
import 'package:fashion_connect/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
    super.onTransition(transition);
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp(authRepository: AuthRepository()));
}

class MyApp extends StatefulWidget {
  final AuthRepository authRepository;

  const MyApp({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthBloc _authBloc;
  AuthRepository get _authRepository => widget.authRepository;

  @override
  void initState() {
    _authBloc = AuthBloc(authRepository: _authRepository);
    _authBloc.onAppStart();
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'QuickSand',
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        accentColor: Colors.yellow[700],
      ),
      routes: <String, WidgetBuilder>{
        '/admin-dashboard': (BuildContext context) => AdminDashboardPage(),
        '/admin-categories': (BuildContext context) => AdminCategoriesPage(),
        '/admin-category-form': (BuildContext context) => AdminCategoryFormPage(),
      },
      home: BlocBuilder<AuthEvent, AuthState>(
        bloc: _authBloc,
        builder: (BuildContext context, AuthState state) {
          if (state is AuthUninitialized) {
            return SplashScreen();
          }

          if (state is AuthAuthenticated) {
            return HomePage();
          }

          if (state is AuthUnauthenticated) {
            return AuthPage(authRepository: _authRepository);
          }

          if (state is AuthLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      bloc: _authBloc,
      child: _buildMaterialApp(),
    );
  }
}
