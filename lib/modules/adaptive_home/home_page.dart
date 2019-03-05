
import 'package:fashion_connect/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('logout'),
          onPressed: () => _authBloc.onLoggedOut(),
        ),
      ),
    );
  }
}
